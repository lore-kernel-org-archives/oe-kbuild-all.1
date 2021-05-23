Content-Type: multipart/mixed; boundary="===============2507631279701788117=="
MIME-Version: 1.0
From: Kyle Tso <kyletso@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/2] usb: typec: tcpm: Properly interrupt VDM AMS
Date: Sun, 23 May 2021 10:02:58 +0800
Message-ID: <CAGZ6i=2SDOWMHVOt0B6bn5=sxKgPR2cvgEX4uXXxJxN67GtLEg@mail.gmail.com>
In-Reply-To: <202105230455.faAHm2qT-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2507631279701788117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 23, 2021 at 4:23 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Kyle,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on usb/usb-testing]
> [also build test WARNING on v5.13-rc2 next-20210521]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Kyle-Tso/Fix-some-VDM-AM=
S-handling/20210522-205431
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git us=
b-testing
> config: x86_64-randconfig-a006-20210523 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project e84a=
9b9bb3051c35dea993cdad7b3d2575638f85)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/6e05980ae46e87d0a409e1e=
653658ae6fd7b3a32
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Kyle-Tso/Fix-some-VDM-AMS-handli=
ng/20210522-205431
>         git checkout 6e05980ae46e87d0a409e1e653658ae6fd7b3a32
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/usb/typec/tcpm/tcpm.c:2326:19: warning: equality comparison re=
sult unused [-Wunused-comparison]
>                    port->vdm_state =3D=3D VDM_STATE_ERR_BUSY;
>                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
>    drivers/usb/typec/tcpm/tcpm.c:2326:19: note: use '=3D' to turn this eq=
uality comparison into an assignment
>                    port->vdm_state =3D=3D VDM_STATE_ERR_BUSY;
>                                    ^~
>                                    =3D
>    1 warning generated.
>
>

Fixed in v2
https://lore.kernel.org/linux-usb/20210523015855.1785484-1-kyletso(a)google=
.com/

thanks,
Kyle

> vim +2326 drivers/usb/typec/tcpm/tcpm.c
>
>   2313
>   2314  static void tcpm_pd_data_request(struct tcpm_port *port,
>   2315                                   const struct pd_message *msg)
>   2316  {
>   2317          enum pd_data_msg_type type =3D pd_header_type_le(msg->hea=
der);
>   2318          unsigned int cnt =3D pd_header_cnt_le(msg->header);
>   2319          unsigned int rev =3D pd_header_rev_le(msg->header);
>   2320          unsigned int i;
>   2321          enum frs_typec_current partner_frs_current;
>   2322          bool frs_enable;
>   2323          int ret;
>   2324
>   2325          if (tcpm_vdm_ams(port) && type !=3D PD_DATA_VENDOR_DEF) {
> > 2326                  port->vdm_state =3D=3D VDM_STATE_ERR_BUSY;
>   2327                  tcpm_ams_finish(port);
>   2328                  mod_vdm_delayed_work(port, 0);
>   2329          }
>   2330
>   2331          switch (type) {
>   2332          case PD_DATA_SOURCE_CAP:
>   2333                  for (i =3D 0; i < cnt; i++)
>   2334                          port->source_caps[i] =3D le32_to_cpu(msg-=
>payload[i]);
>   2335
>   2336                  port->nr_source_caps =3D cnt;
>   2337
>   2338                  tcpm_log_source_caps(port);
>   2339
>   2340                  tcpm_validate_caps(port, port->source_caps,
>   2341                                     port->nr_source_caps);
>   2342
>   2343                  /*
>   2344                   * Adjust revision in subsequent message headers,=
 as required,
>   2345                   * to comply with 6.2.1.1.5 of the USB PD 3.0 spe=
c. We don't
>   2346                   * support Rev 1.0 so just do nothing in that sce=
nario.
>   2347                   */
>   2348                  if (rev =3D=3D PD_REV10) {
>   2349                          if (port->ams =3D=3D GET_SOURCE_CAPABILIT=
IES)
>   2350                                  tcpm_ams_finish(port);
>   2351                          break;
>   2352                  }
>   2353
>   2354                  if (rev < PD_MAX_REV)
>   2355                          port->negotiated_rev =3D rev;
>   2356
>   2357                  if (port->pwr_role =3D=3D TYPEC_SOURCE) {
>   2358                          if (port->ams =3D=3D GET_SOURCE_CAPABILIT=
IES)
>   2359                                  tcpm_pd_handle_state(port, SRC_RE=
ADY, NONE_AMS, 0);
>   2360                          /* Unexpected Source Capabilities */
>   2361                          else
>   2362                                  tcpm_pd_handle_msg(port,
>   2363                                                     port->negotiat=
ed_rev < PD_REV30 ?
>   2364                                                     PD_MSG_CTRL_RE=
JECT :
>   2365                                                     PD_MSG_CTRL_NO=
T_SUPP,
>   2366                                                     NONE_AMS);
>   2367                  } else if (port->state =3D=3D SNK_WAIT_CAPABILITI=
ES) {
>   2368                  /*
>   2369                   * This message may be received even if VBUS is n=
ot
>   2370                   * present. This is quite unexpected; see USB PD
>   2371                   * specification, sections 8.3.3.6.3.1 and 8.3.3.=
6.3.2.
>   2372                   * However, at the same time, we must be ready to
>   2373                   * receive this message and respond to it 15ms af=
ter
>   2374                   * receiving PS_RDY during power swap operations,=
 no matter
>   2375                   * if VBUS is available or not (USB PD specificat=
ion,
>   2376                   * section 6.5.9.2).
>   2377                   * So we need to accept the message either way,
>   2378                   * but be prepared to keep waiting for VBUS after=
 it was
>   2379                   * handled.
>   2380                   */
>   2381                          port->ams =3D POWER_NEGOTIATION;
>   2382                          port->in_ams =3D true;
>   2383                          tcpm_set_state(port, SNK_NEGOTIATE_CAPABI=
LITIES, 0);
>   2384                  } else {
>   2385                          if (port->ams =3D=3D GET_SOURCE_CAPABILIT=
IES)
>   2386                                  tcpm_ams_finish(port);
>   2387                          tcpm_pd_handle_state(port, SNK_NEGOTIATE_=
CAPABILITIES,
>   2388                                               POWER_NEGOTIATION, 0=
);
>   2389                  }
>   2390                  break;
>   2391          case PD_DATA_REQUEST:
>   2392                  /*
>   2393                   * Adjust revision in subsequent message headers,=
 as required,
>   2394                   * to comply with 6.2.1.1.5 of the USB PD 3.0 spe=
c. We don't
>   2395                   * support Rev 1.0 so just reject in that scenari=
o.
>   2396                   */
>   2397                  if (rev =3D=3D PD_REV10) {
>   2398                          tcpm_pd_handle_msg(port,
>   2399                                             port->negotiated_rev <=
 PD_REV30 ?
>   2400                                             PD_MSG_CTRL_REJECT :
>   2401                                             PD_MSG_CTRL_NOT_SUPP,
>   2402                                             NONE_AMS);
>   2403                          break;
>   2404                  }
>   2405
>   2406                  if (rev < PD_MAX_REV)
>   2407                          port->negotiated_rev =3D rev;
>   2408
>   2409                  if (port->pwr_role !=3D TYPEC_SOURCE || cnt !=3D =
1) {
>   2410                          tcpm_pd_handle_msg(port,
>   2411                                             port->negotiated_rev <=
 PD_REV30 ?
>   2412                                             PD_MSG_CTRL_REJECT :
>   2413                                             PD_MSG_CTRL_NOT_SUPP,
>   2414                                             NONE_AMS);
>   2415                          break;
>   2416                  }
>   2417
>   2418                  port->sink_request =3D le32_to_cpu(msg->payload[0=
]);
>   2419
>   2420                  if (port->vdm_sm_running && port->explicit_contra=
ct) {
>   2421                          tcpm_pd_handle_msg(port, PD_MSG_CTRL_WAIT=
, port->ams);
>   2422                          break;
>   2423                  }
>   2424
>   2425                  if (port->state =3D=3D SRC_SEND_CAPABILITIES)
>   2426                          tcpm_set_state(port, SRC_NEGOTIATE_CAPABI=
LITIES, 0);
>   2427                  else
>   2428                          tcpm_pd_handle_state(port, SRC_NEGOTIATE_=
CAPABILITIES,
>   2429                                               POWER_NEGOTIATION, 0=
);
>   2430                  break;
>   2431          case PD_DATA_SINK_CAP:
>   2432                  /* We don't do anything with this at the moment..=
. */
>   2433                  for (i =3D 0; i < cnt; i++)
>   2434                          port->sink_caps[i] =3D le32_to_cpu(msg->p=
ayload[i]);
>   2435
>   2436                  partner_frs_current =3D (port->sink_caps[0] & PDO=
_FIXED_FRS_CURR_MASK) >>
>   2437                          PDO_FIXED_FRS_CURR_SHIFT;
>   2438                  frs_enable =3D partner_frs_current && (partner_fr=
s_current <=3D
>   2439                                                       port->new_so=
urce_frs_current);
>   2440                  tcpm_log(port,
>   2441                           "Port partner FRS capable partner_frs_cu=
rrent:%u port_frs_current:%u enable:%c",
>   2442                           partner_frs_current, port->new_source_fr=
s_current, frs_enable ? 'y' : 'n');
>   2443                  if (frs_enable) {
>   2444                          ret  =3D port->tcpc->enable_frs(port->tcp=
c, true);
>   2445                          tcpm_log(port, "Enable FRS %s, ret:%d\n",=
 ret ? "fail" : "success", ret);
>   2446                  }
>   2447
>   2448                  port->nr_sink_caps =3D cnt;
>   2449                  port->sink_cap_done =3D true;
>   2450                  if (port->ams =3D=3D GET_SINK_CAPABILITIES)
>   2451                          tcpm_set_state(port, ready_state(port), 0=
);
>   2452                  /* Unexpected Sink Capabilities */
>   2453                  else
>   2454                          tcpm_pd_handle_msg(port,
>   2455                                             port->negotiated_rev <=
 PD_REV30 ?
>   2456                                             PD_MSG_CTRL_REJECT :
>   2457                                             PD_MSG_CTRL_NOT_SUPP,
>   2458                                             NONE_AMS);
>   2459                  break;
>   2460          case PD_DATA_VENDOR_DEF:
>   2461                  tcpm_handle_vdm_request(port, msg->payload, cnt);
>   2462                  break;
>   2463          case PD_DATA_BIST:
>   2464                  port->bist_request =3D le32_to_cpu(msg->payload[0=
]);
>   2465                  tcpm_pd_handle_state(port, BIST_RX, BIST, 0);
>   2466                  break;
>   2467          case PD_DATA_ALERT:
>   2468                  tcpm_handle_alert(port, msg->payload, cnt);
>   2469                  break;
>   2470          case PD_DATA_BATT_STATUS:
>   2471          case PD_DATA_GET_COUNTRY_INFO:
>   2472                  /* Currently unsupported */
>   2473                  tcpm_pd_handle_msg(port, port->negotiated_rev < P=
D_REV30 ?
>   2474                                     PD_MSG_CTRL_REJECT :
>   2475                                     PD_MSG_CTRL_NOT_SUPP,
>   2476                                     NONE_AMS);
>   2477                  break;
>   2478          default:
>   2479                  tcpm_pd_handle_msg(port, port->negotiated_rev < P=
D_REV30 ?
>   2480                                     PD_MSG_CTRL_REJECT :
>   2481                                     PD_MSG_CTRL_NOT_SUPP,
>   2482                                     NONE_AMS);
>   2483                  tcpm_log(port, "Unrecognized data message type %#=
x", type);
>   2484                  break;
>   2485          }
>   2486  }
>   2487
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2507631279701788117==--

