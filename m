Content-Type: multipart/mixed; boundary="===============6401415473514519566=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/2] usb: typec: tcpm: Properly interrupt VDM AMS
Date: Sun, 23 May 2021 04:22:33 +0800
Message-ID: <202105230455.faAHm2qT-lkp@intel.com>
In-Reply-To: <20210521130121.1470334-2-kyletso@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6401415473514519566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on v5.13-rc2 next-20210521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kyle-Tso/Fix-some-VDM-AMS-=
handling/20210522-205431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
config: x86_64-randconfig-a006-20210523 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project e84a9b=
9bb3051c35dea993cdad7b3d2575638f85)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://github.com/0day-ci/linux/commit/6e05980ae46e87d0a409e1e65=
3658ae6fd7b3a32
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kyle-Tso/Fix-some-VDM-AMS-handling=
/20210522-205431
        git checkout 6e05980ae46e87d0a409e1e653658ae6fd7b3a32
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/tcpm/tcpm.c:2326:19: warning: equality comparison resu=
lt unused [-Wunused-comparison]
                   port->vdm_state =3D=3D VDM_STATE_ERR_BUSY;
                   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tcpm/tcpm.c:2326:19: note: use '=3D' to turn this equa=
lity comparison into an assignment
                   port->vdm_state =3D=3D VDM_STATE_ERR_BUSY;
                                   ^~
                                   =3D
   1 warning generated.


vim +2326 drivers/usb/typec/tcpm/tcpm.c

  2313	=

  2314	static void tcpm_pd_data_request(struct tcpm_port *port,
  2315					 const struct pd_message *msg)
  2316	{
  2317		enum pd_data_msg_type type =3D pd_header_type_le(msg->header);
  2318		unsigned int cnt =3D pd_header_cnt_le(msg->header);
  2319		unsigned int rev =3D pd_header_rev_le(msg->header);
  2320		unsigned int i;
  2321		enum frs_typec_current partner_frs_current;
  2322		bool frs_enable;
  2323		int ret;
  2324	=

  2325		if (tcpm_vdm_ams(port) && type !=3D PD_DATA_VENDOR_DEF) {
> 2326			port->vdm_state =3D=3D VDM_STATE_ERR_BUSY;
  2327			tcpm_ams_finish(port);
  2328			mod_vdm_delayed_work(port, 0);
  2329		}
  2330	=

  2331		switch (type) {
  2332		case PD_DATA_SOURCE_CAP:
  2333			for (i =3D 0; i < cnt; i++)
  2334				port->source_caps[i] =3D le32_to_cpu(msg->payload[i]);
  2335	=

  2336			port->nr_source_caps =3D cnt;
  2337	=

  2338			tcpm_log_source_caps(port);
  2339	=

  2340			tcpm_validate_caps(port, port->source_caps,
  2341					   port->nr_source_caps);
  2342	=

  2343			/*
  2344			 * Adjust revision in subsequent message headers, as required,
  2345			 * to comply with 6.2.1.1.5 of the USB PD 3.0 spec. We don't
  2346			 * support Rev 1.0 so just do nothing in that scenario.
  2347			 */
  2348			if (rev =3D=3D PD_REV10) {
  2349				if (port->ams =3D=3D GET_SOURCE_CAPABILITIES)
  2350					tcpm_ams_finish(port);
  2351				break;
  2352			}
  2353	=

  2354			if (rev < PD_MAX_REV)
  2355				port->negotiated_rev =3D rev;
  2356	=

  2357			if (port->pwr_role =3D=3D TYPEC_SOURCE) {
  2358				if (port->ams =3D=3D GET_SOURCE_CAPABILITIES)
  2359					tcpm_pd_handle_state(port, SRC_READY, NONE_AMS, 0);
  2360				/* Unexpected Source Capabilities */
  2361				else
  2362					tcpm_pd_handle_msg(port,
  2363							   port->negotiated_rev < PD_REV30 ?
  2364							   PD_MSG_CTRL_REJECT :
  2365							   PD_MSG_CTRL_NOT_SUPP,
  2366							   NONE_AMS);
  2367			} else if (port->state =3D=3D SNK_WAIT_CAPABILITIES) {
  2368			/*
  2369			 * This message may be received even if VBUS is not
  2370			 * present. This is quite unexpected; see USB PD
  2371			 * specification, sections 8.3.3.6.3.1 and 8.3.3.6.3.2.
  2372			 * However, at the same time, we must be ready to
  2373			 * receive this message and respond to it 15ms after
  2374			 * receiving PS_RDY during power swap operations, no matter
  2375			 * if VBUS is available or not (USB PD specification,
  2376			 * section 6.5.9.2).
  2377			 * So we need to accept the message either way,
  2378			 * but be prepared to keep waiting for VBUS after it was
  2379			 * handled.
  2380			 */
  2381				port->ams =3D POWER_NEGOTIATION;
  2382				port->in_ams =3D true;
  2383				tcpm_set_state(port, SNK_NEGOTIATE_CAPABILITIES, 0);
  2384			} else {
  2385				if (port->ams =3D=3D GET_SOURCE_CAPABILITIES)
  2386					tcpm_ams_finish(port);
  2387				tcpm_pd_handle_state(port, SNK_NEGOTIATE_CAPABILITIES,
  2388						     POWER_NEGOTIATION, 0);
  2389			}
  2390			break;
  2391		case PD_DATA_REQUEST:
  2392			/*
  2393			 * Adjust revision in subsequent message headers, as required,
  2394			 * to comply with 6.2.1.1.5 of the USB PD 3.0 spec. We don't
  2395			 * support Rev 1.0 so just reject in that scenario.
  2396			 */
  2397			if (rev =3D=3D PD_REV10) {
  2398				tcpm_pd_handle_msg(port,
  2399						   port->negotiated_rev < PD_REV30 ?
  2400						   PD_MSG_CTRL_REJECT :
  2401						   PD_MSG_CTRL_NOT_SUPP,
  2402						   NONE_AMS);
  2403				break;
  2404			}
  2405	=

  2406			if (rev < PD_MAX_REV)
  2407				port->negotiated_rev =3D rev;
  2408	=

  2409			if (port->pwr_role !=3D TYPEC_SOURCE || cnt !=3D 1) {
  2410				tcpm_pd_handle_msg(port,
  2411						   port->negotiated_rev < PD_REV30 ?
  2412						   PD_MSG_CTRL_REJECT :
  2413						   PD_MSG_CTRL_NOT_SUPP,
  2414						   NONE_AMS);
  2415				break;
  2416			}
  2417	=

  2418			port->sink_request =3D le32_to_cpu(msg->payload[0]);
  2419	=

  2420			if (port->vdm_sm_running && port->explicit_contract) {
  2421				tcpm_pd_handle_msg(port, PD_MSG_CTRL_WAIT, port->ams);
  2422				break;
  2423			}
  2424	=

  2425			if (port->state =3D=3D SRC_SEND_CAPABILITIES)
  2426				tcpm_set_state(port, SRC_NEGOTIATE_CAPABILITIES, 0);
  2427			else
  2428				tcpm_pd_handle_state(port, SRC_NEGOTIATE_CAPABILITIES,
  2429						     POWER_NEGOTIATION, 0);
  2430			break;
  2431		case PD_DATA_SINK_CAP:
  2432			/* We don't do anything with this at the moment... */
  2433			for (i =3D 0; i < cnt; i++)
  2434				port->sink_caps[i] =3D le32_to_cpu(msg->payload[i]);
  2435	=

  2436			partner_frs_current =3D (port->sink_caps[0] & PDO_FIXED_FRS_CURR_M=
ASK) >>
  2437				PDO_FIXED_FRS_CURR_SHIFT;
  2438			frs_enable =3D partner_frs_current && (partner_frs_current <=3D
  2439							     port->new_source_frs_current);
  2440			tcpm_log(port,
  2441				 "Port partner FRS capable partner_frs_current:%u port_frs_curren=
t:%u enable:%c",
  2442				 partner_frs_current, port->new_source_frs_current, frs_enable ? =
'y' : 'n');
  2443			if (frs_enable) {
  2444				ret  =3D port->tcpc->enable_frs(port->tcpc, true);
  2445				tcpm_log(port, "Enable FRS %s, ret:%d\n", ret ? "fail" : "success=
", ret);
  2446			}
  2447	=

  2448			port->nr_sink_caps =3D cnt;
  2449			port->sink_cap_done =3D true;
  2450			if (port->ams =3D=3D GET_SINK_CAPABILITIES)
  2451				tcpm_set_state(port, ready_state(port), 0);
  2452			/* Unexpected Sink Capabilities */
  2453			else
  2454				tcpm_pd_handle_msg(port,
  2455						   port->negotiated_rev < PD_REV30 ?
  2456						   PD_MSG_CTRL_REJECT :
  2457						   PD_MSG_CTRL_NOT_SUPP,
  2458						   NONE_AMS);
  2459			break;
  2460		case PD_DATA_VENDOR_DEF:
  2461			tcpm_handle_vdm_request(port, msg->payload, cnt);
  2462			break;
  2463		case PD_DATA_BIST:
  2464			port->bist_request =3D le32_to_cpu(msg->payload[0]);
  2465			tcpm_pd_handle_state(port, BIST_RX, BIST, 0);
  2466			break;
  2467		case PD_DATA_ALERT:
  2468			tcpm_handle_alert(port, msg->payload, cnt);
  2469			break;
  2470		case PD_DATA_BATT_STATUS:
  2471		case PD_DATA_GET_COUNTRY_INFO:
  2472			/* Currently unsupported */
  2473			tcpm_pd_handle_msg(port, port->negotiated_rev < PD_REV30 ?
  2474					   PD_MSG_CTRL_REJECT :
  2475					   PD_MSG_CTRL_NOT_SUPP,
  2476					   NONE_AMS);
  2477			break;
  2478		default:
  2479			tcpm_pd_handle_msg(port, port->negotiated_rev < PD_REV30 ?
  2480					   PD_MSG_CTRL_REJECT :
  2481					   PD_MSG_CTRL_NOT_SUPP,
  2482					   NONE_AMS);
  2483			tcpm_log(port, "Unrecognized data message type %#x", type);
  2484			break;
  2485		}
  2486	}
  2487	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============6401415473514519566==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6401415473514519566==--

