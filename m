Content-Type: multipart/mixed; boundary="===============3268371679669554316=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/net/ethernet/intel/igc/igc_ptp.c:397:17: sparse: sparse: incorrect type in argument 1 (different base types)
Date: Wed, 27 May 2020 19:17:29 +0800
Message-ID: <202005271926.c6kaTjRU%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3268371679669554316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   444fc5cde64330661bf59944c43844e7d4c2ccd8
commit: 81b055205e8ba2d400c8fa5845ba540a4a880a3a igc: Add support for RX ti=
mestamping
date:   5 months ago
config: ia64-randconfig-s032-20200527 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-240-gf0fe1cd9-dirty
        git checkout 81b055205e8ba2d400c8fa5845ba540a4a880a3a
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Dia64 CF=3D'-fdiagnostic-prefix -D__CHECK_EN=
DIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   ./arch/ia64/include/generated/uapi/asm/unistd_64.h:348:39: sparse: spars=
e: no newline at end of file
>> drivers/net/ethernet/intel/igc/igc_ptp.c:397:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] value @@     got restricted __be16 [usertype] @@
>> drivers/net/ethernet/intel/igc/igc_ptp.c:397:17: sparse:     expected un=
signed int [usertype] value
   drivers/net/ethernet/intel/igc/igc_ptp.c:397:17: sparse:     got restric=
ted __be16 [usertype]
   drivers/net/ethernet/intel/igc/igc_ptp.c:415:6: sparse: sparse: symbol '=
igc_ptp_tx_hang' was not declared. Should it be static?
   drivers/net/ethernet/intel/igc/igc_ptp.c:445:6: sparse: sparse: symbol '=
igc_ptp_tx_work' was not declared. Should it be static?
   drivers/net/ethernet/intel/igc/igc_ptp.c:549:6: sparse: sparse: symbol '=
igc_ptp_suspend' was not declared. Should it be static?
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]

vim +397 drivers/net/ethernet/intel/igc/igc_ptp.c

   281	=

   282	/**
   283	 * igc_ptp_set_timestamp_mode - setup hardware for timestamping
   284	 * @adapter: networking device structure
   285	 * @config: hwtstamp configuration
   286	 *
   287	 * Incoming time stamping has to be configured via the hardware
   288	 * filters. Not all combinations are supported, in particular event
   289	 * type has to be specified. Matching the kind of event packet is
   290	 * not supported, with the exception of "all V2 events regardless of
   291	 * level 2 or 4".
   292	 *
   293	 */
   294	static int igc_ptp_set_timestamp_mode(struct igc_adapter *adapter,
   295					      struct hwtstamp_config *config)
   296	{
   297		u32 tsync_rx_ctl =3D IGC_TSYNCRXCTL_ENABLED;
   298		struct igc_hw *hw =3D &adapter->hw;
   299		u32 tsync_rx_cfg =3D 0;
   300		bool is_l4 =3D false;
   301		bool is_l2 =3D false;
   302		u32 regval;
   303	=

   304		/* reserved for future extensions */
   305		if (config->flags)
   306			return -EINVAL;
   307	=

   308		switch (config->rx_filter) {
   309		case HWTSTAMP_FILTER_NONE:
   310			tsync_rx_ctl =3D 0;
   311			break;
   312		case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
   313			tsync_rx_ctl |=3D IGC_TSYNCRXCTL_TYPE_L4_V1;
   314			tsync_rx_cfg =3D IGC_TSYNCRXCFG_PTP_V1_SYNC_MESSAGE;
   315			is_l4 =3D true;
   316			break;
   317		case HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ:
   318			tsync_rx_ctl |=3D IGC_TSYNCRXCTL_TYPE_L4_V1;
   319			tsync_rx_cfg =3D IGC_TSYNCRXCFG_PTP_V1_DELAY_REQ_MESSAGE;
   320			is_l4 =3D true;
   321			break;
   322		case HWTSTAMP_FILTER_PTP_V2_EVENT:
   323		case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
   324		case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
   325		case HWTSTAMP_FILTER_PTP_V2_SYNC:
   326		case HWTSTAMP_FILTER_PTP_V2_L2_SYNC:
   327		case HWTSTAMP_FILTER_PTP_V2_L4_SYNC:
   328		case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
   329		case HWTSTAMP_FILTER_PTP_V2_L2_DELAY_REQ:
   330		case HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ:
   331			tsync_rx_ctl |=3D IGC_TSYNCRXCTL_TYPE_EVENT_V2;
   332			config->rx_filter =3D HWTSTAMP_FILTER_PTP_V2_EVENT;
   333			is_l2 =3D true;
   334			is_l4 =3D true;
   335			break;
   336		case HWTSTAMP_FILTER_PTP_V1_L4_EVENT:
   337		case HWTSTAMP_FILTER_NTP_ALL:
   338		case HWTSTAMP_FILTER_ALL:
   339			tsync_rx_ctl |=3D IGC_TSYNCRXCTL_TYPE_ALL;
   340			config->rx_filter =3D HWTSTAMP_FILTER_ALL;
   341			break;
   342			/* fall through */
   343		default:
   344			config->rx_filter =3D HWTSTAMP_FILTER_NONE;
   345			return -ERANGE;
   346		}
   347	=

   348		/* Per-packet timestamping only works if all packets are
   349		 * timestamped, so enable timestamping in all packets as long
   350		 * as one Rx filter was configured.
   351		 */
   352		if (tsync_rx_ctl) {
   353			tsync_rx_ctl =3D IGC_TSYNCRXCTL_ENABLED;
   354			tsync_rx_ctl |=3D IGC_TSYNCRXCTL_TYPE_ALL;
   355			config->rx_filter =3D HWTSTAMP_FILTER_ALL;
   356			is_l2 =3D true;
   357			is_l4 =3D true;
   358	=

   359			if (hw->mac.type =3D=3D igc_i225) {
   360				regval =3D rd32(IGC_RXPBS);
   361				regval |=3D IGC_RXPBS_CFG_TS_EN;
   362				wr32(IGC_RXPBS, regval);
   363	=

   364				/* FIXME: For now, only support retrieving RX
   365				 * timestamps from timer 0
   366				 */
   367				igc_ptp_enable_tstamp_all_rxqueues(adapter, 0);
   368			}
   369		}
   370	=

   371		/* enable/disable RX */
   372		regval =3D rd32(IGC_TSYNCRXCTL);
   373		regval &=3D ~(IGC_TSYNCRXCTL_ENABLED | IGC_TSYNCRXCTL_TYPE_MASK);
   374		regval |=3D tsync_rx_ctl;
   375		wr32(IGC_TSYNCRXCTL, regval);
   376	=

   377		/* define which PTP packets are time stamped */
   378		wr32(IGC_TSYNCRXCFG, tsync_rx_cfg);
   379	=

   380		/* define ethertype filter for timestamped packets */
   381		if (is_l2)
   382			wr32(IGC_ETQF(3),
   383			     (IGC_ETQF_FILTER_ENABLE | /* enable filter */
   384			     IGC_ETQF_1588 | /* enable timestamping */
   385			     ETH_P_1588)); /* 1588 eth protocol type */
   386		else
   387			wr32(IGC_ETQF(3), 0);
   388	=

   389		/* L4 Queue Filter[3]: filter by destination port and protocol */
   390		if (is_l4) {
   391			u32 ftqf =3D (IPPROTO_UDP /* UDP */
   392				    | IGC_FTQF_VF_BP /* VF not compared */
   393				    | IGC_FTQF_1588_TIME_STAMP /* Enable Timestamp */
   394				    | IGC_FTQF_MASK); /* mask all inputs */
   395			ftqf &=3D ~IGC_FTQF_MASK_PROTO_BP; /* enable protocol check */
   396	=

 > 397			wr32(IGC_IMIR(3), htons(PTP_EV_PORT));
   398			wr32(IGC_IMIREXT(3),
   399			     (IGC_IMIREXT_SIZE_BP | IGC_IMIREXT_CTRL_BP));
   400			wr32(IGC_FTQF(3), ftqf);
   401		} else {
   402			wr32(IGC_FTQF(3), IGC_FTQF_MASK);
   403		}
   404		wrfl();
   405	=

   406		/* clear TX/RX time stamp registers, just to be sure */
   407		regval =3D rd32(IGC_TXSTMPL);
   408		regval =3D rd32(IGC_TXSTMPH);
   409		regval =3D rd32(IGC_RXSTMPL);
   410		regval =3D rd32(IGC_RXSTMPH);
   411	=

   412		return 0;
   413	}
   414	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3268371679669554316==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3268371679669554316==--

