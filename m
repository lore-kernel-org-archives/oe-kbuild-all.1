Content-Type: multipart/mixed; boundary="===============6013125141067057427=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/usb/cdns3/gadget.c:1173:29: sparse: sparse: incorrect type in assignment (different base types)
Date: Sun, 31 May 2020 07:50:40 +0800
Message-ID: <202005310738.dQz9lul0%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6013125141067057427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ffeb595d84811dde16a28b33d8a7cf26d51d51b3
commit: 70d8b9e5e63d212019ba3f6823c8ec3d2df87645 usb: cdns3: make signed 1 =
bit bitfields unsigned
date:   9 weeks ago
config: i386-randconfig-s031-20200531 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-243-gc100a7ab-dirty
        git checkout 70d8b9e5e63d212019ba3f6823c8ec3d2df87645
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Di386 CF=3D'-fdiagnostic-prefix -D__CHECK_EN=
DIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/usb/cdns3/gadget.c:1157:35: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1157:35: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1157:35: sparse:     got unsigned long
>> drivers/usb/cdns3/gadget.c:1173:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] buffer @@     got unsigned long long @@
   drivers/usb/cdns3/gadget.c:1173:29: sparse:     expected restricted __le=
32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:1173:29: sparse:     got unsigned long long
   drivers/usb/cdns3/gadget.c:1188:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] length @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1188:29: sparse:     expected restricted __le=
32 [usertype] length
   drivers/usb/cdns3/gadget.c:1188:29: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1191:37: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/cdns3/gadget.c:1191:37: sparse:    left side has type restri=
cted __le32
   drivers/usb/cdns3/gadget.c:1191:37: sparse:    right side has type unsig=
ned long
   drivers/usb/cdns3/gadget.c:1213:38: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned int [assigned] [usertype] control @@
   drivers/usb/cdns3/gadget.c:1213:38: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1213:38: sparse:     got unsigned int [assign=
ed] [usertype] control
   drivers/usb/cdns3/gadget.c:1215:48: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned int [assigned] [usertype] control @@
   drivers/usb/cdns3/gadget.c:1215:48: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1215:48: sparse:     got unsigned int [assign=
ed] [usertype] control
   drivers/usb/cdns3/gadget.c:1229:30: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/cdns3/gadget.c:1229:30: sparse:    left side has type restri=
cted __le32
   drivers/usb/cdns3/gadget.c:1229:30: sparse:    right side has type unsig=
ned long
   drivers/usb/cdns3/gadget.c:1255:36: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:1255:30: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned int @@
   drivers/usb/cdns3/gadget.c:1255:30: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1255:30: sparse:     got unsigned int
   drivers/usb/cdns3/gadget.c:1010:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] buffer @@     got unsigned long long @@
   drivers/usb/cdns3/gadget.c:1010:29: sparse:     expected restricted __le=
32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:1010:29: sparse:     got unsigned long long
   drivers/usb/cdns3/gadget.c:1013:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] buffer @@     got unsigned long long @@
   drivers/usb/cdns3/gadget.c:1013:29: sparse:     expected restricted __le=
32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:1013:29: sparse:     got unsigned long long
   drivers/usb/cdns3/gadget.c:1019:21: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] length @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1019:21: sparse:     expected restricted __le=
32 [usertype] length
   drivers/usb/cdns3/gadget.c:1019:21: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1029:37: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/cdns3/gadget.c:1029:37: sparse:    left side has type restri=
cted __le32
   drivers/usb/cdns3/gadget.c:1029:37: sparse:    right side has type unsig=
ned long
   drivers/usb/cdns3/gadget.c:1033:22: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned int [assigned] [usertype] control @@
   drivers/usb/cdns3/gadget.c:1033:22: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1033:22: sparse:     got unsigned int [assign=
ed] [usertype] control
   drivers/usb/cdns3/gadget.c:85:6: sparse: sparse: symbol 'cdns3_clear_reg=
ister_bit' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:140:26: sparse: sparse: symbol 'cdns3_next_al=
ign_buf' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:151:22: sparse: sparse: symbol 'cdns3_next_pr=
iv_request' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:193:5: sparse: sparse: symbol 'cdns3_ring_siz=
e' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:263:34: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __le32 [usertype]=
 buffer @@     got unsigned long long @@
   drivers/usb/cdns3/gadget.c:263:34: sparse:     expected restricted __le3=
2 [usertype] buffer
   drivers/usb/cdns3/gadget.c:263:34: sparse:     got unsigned long long
   drivers/usb/cdns3/gadget.c:264:35: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __le32 [usertype]=
 control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:264:35: sparse:     expected restricted __le3=
2 [usertype] control
   drivers/usb/cdns3/gadget.c:264:35: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:348:6: sparse: sparse: symbol 'cdns3_move_deq=
_to_next_trb' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:514:20: sparse: sparse: symbol 'cdns3_wa2_gad=
get_giveback' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:554:5: sparse: sparse: symbol 'cdns3_wa2_gadg=
et_ep_queue' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:849:49: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/usb/cdns3/gadget.c:848:51: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __le32 [usertype]=
 control @@     got unsigned int @@
   drivers/usb/cdns3/gadget.c:848:51: sparse:     expected restricted __le3=
2 [usertype] control
   drivers/usb/cdns3/gadget.c:848:51: sparse:     got unsigned int
   drivers/usb/cdns3/gadget.c:852:49: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/usb/cdns3/gadget.c:851:51: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __le32 [usertype]=
 control @@     got unsigned int @@
   drivers/usb/cdns3/gadget.c:851:51: sparse:     expected restricted __le3=
2 [usertype] control
   drivers/usb/cdns3/gadget.c:851:51: sparse:     got unsigned int
   drivers/usb/cdns3/gadget.c:839:6: sparse: sparse: symbol 'cdns3_wa1_rest=
ore_cycle_bit' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:1393:17: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:1442:21: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:1574:35: sparse: sparse: dubious: x | !y
   drivers/usb/cdns3/gadget.c:1907:6: sparse: sparse: symbol 'cdns3_stream_=
ep_reconfig' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:1928:6: sparse: sparse: symbol 'cdns3_configu=
re_dmult' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:2552:34: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] buffer @@     got unsigned long long @@
   drivers/usb/cdns3/gadget.c:2552:34: sparse:     expected restricted __le=
32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:2552:34: sparse:     got unsigned long long
   drivers/usb/cdns3/gadget.c:2554:46: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:2554:35: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2554:35: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:2554:35: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:2610:43: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:2610:38: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2610:38: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:2610:38: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:2625:43: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:2625:38: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2625:38: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:2625:38: sparse:     got unsigned long
--
>> drivers/usb/cdns3/ep0.c:40:37: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] buf=
fer @@     got unsigned long long @@
   drivers/usb/cdns3/ep0.c:40:37: sparse:     expected restricted __le32 [u=
sertype] buffer
   drivers/usb/cdns3/ep0.c:40:37: sparse:     got unsigned long long
   drivers/usb/cdns3/ep0.c:41:37: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] len=
gth @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:41:37: sparse:     expected restricted __le32 [u=
sertype] length
   drivers/usb/cdns3/ep0.c:41:37: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:44:46: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] con=
trol @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:44:46: sparse:     expected restricted __le32 [u=
sertype] control
   drivers/usb/cdns3/ep0.c:44:46: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:45:45: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] buf=
fer @@     got unsigned long long @@
   drivers/usb/cdns3/ep0.c:45:45: sparse:     expected restricted __le32 [u=
sertype] buffer
   drivers/usb/cdns3/ep0.c:45:45: sparse:     got unsigned long long
   drivers/usb/cdns3/ep0.c:46:45: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] len=
gth @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:46:45: sparse:     expected restricted __le32 [u=
sertype] length
   drivers/usb/cdns3/ep0.c:46:45: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:47:46: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] con=
trol @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:47:46: sparse:     expected restricted __le32 [u=
sertype] control
   drivers/usb/cdns3/ep0.c:47:46: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:50:46: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] con=
trol @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:50:46: sparse:     expected restricted __le32 [u=
sertype] control
   drivers/usb/cdns3/ep0.c:50:46: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:267:52: sparse: sparse: incorrect type in argume=
nt 1 (different base types) @@     expected unsigned char [usertype] ep_add=
r @@     got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:267:52: sparse:     expected unsigned char [user=
type] ep_addr
   drivers/usb/cdns3/ep0.c:267:52: sparse:     got restricted __le16 [usert=
ype] wIndex
   drivers/usb/cdns3/ep0.c:271:47: sparse: sparse: incorrect type in argume=
nt 2 (different base types) @@     expected unsigned int [usertype] ep @@  =
   got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:271:47: sparse:     expected unsigned int [usert=
ype] ep
   drivers/usb/cdns3/ep0.c:271:47: sparse:     got restricted __le16 [usert=
ype] wIndex
   drivers/usb/cdns3/ep0.c:387:19: sparse: sparse: restricted __le16 degrad=
es to integer
   drivers/usb/cdns3/ep0.c:390:44: sparse: sparse: incorrect type in argume=
nt 1 (different base types) @@     expected unsigned char [usertype] ep_add=
r @@     got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:390:44: sparse:     expected unsigned char [user=
type] ep_addr
   drivers/usb/cdns3/ep0.c:390:44: sparse:     got restricted __le16 [usert=
ype] wIndex
   drivers/usb/cdns3/ep0.c:393:39: sparse: sparse: incorrect type in argume=
nt 2 (different base types) @@     expected unsigned int [usertype] ep @@  =
   got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:393:39: sparse:     expected unsigned int [usert=
ype] ep
   drivers/usb/cdns3/ep0.c:393:39: sparse:     got restricted __le16 [usert=
ype] wIndex
   drivers/usb/cdns3/ep0.c:454:21: sparse: sparse: restricted __le16 degrad=
es to integer
   drivers/usb/cdns3/ep0.c:478:31: sparse: sparse: incorrect type in assign=
ment (different base types) @@     expected unsigned short [usertype] isoch=
_delay @@     got restricted __le16 [usertype] wValue @@
   drivers/usb/cdns3/ep0.c:478:31: sparse:     expected unsigned short [use=
rtype] isoch_delay
   drivers/usb/cdns3/ep0.c:478:31: sparse:     got restricted __le16 [usert=
ype] wValue

vim +1173 drivers/usb/cdns3/gadget.c

54c4c69f0baa43 Jayshri Pawar  2019-12-13  1079  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1080  /**
7733f6c32e36ff Pawel Laszczak 2019-08-26  1081   * cdns3_ep_run_transfer - =
start transfer on no-default endpoint hardware
7733f6c32e36ff Pawel Laszczak 2019-08-26  1082   * @priv_ep: endpoint object
7733f6c32e36ff Pawel Laszczak 2019-08-26  1083   *
7733f6c32e36ff Pawel Laszczak 2019-08-26  1084   * Returns zero on success =
or negative value on failure
7733f6c32e36ff Pawel Laszczak 2019-08-26  1085   */
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1086  static int cdns3_ep_run_tra=
nsfer(struct cdns3_endpoint *priv_ep,
7733f6c32e36ff Pawel Laszczak 2019-08-26  1087  				 struct usb_request *re=
quest)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1088  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1089  	struct cdns3_device *priv_=
dev =3D priv_ep->cdns3_dev;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1090  	struct cdns3_request *priv=
_req;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1091  	struct cdns3_trb *trb;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1092  	dma_addr_t trb_dma;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1093  	u32 togle_pcs =3D 1;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1094  	int sg_iter =3D 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1095  	int num_trb;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1096  	int address;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1097  	u32 control;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1098  	int pcs;
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1099  	u16 total_tdl =3D 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1100  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1101  	if (priv_ep->type =3D=3D U=
SB_ENDPOINT_XFER_ISOC)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1102  		num_trb =3D priv_ep->inte=
rval;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1103  	else
7733f6c32e36ff Pawel Laszczak 2019-08-26  1104  		num_trb =3D request->num_=
sgs ? request->num_sgs : 1;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1105  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1106  	if (num_trb > priv_ep->fre=
e_trbs) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1107  		priv_ep->flags |=3D EP_RI=
NG_FULL;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1108  		return -ENOBUFS;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1109  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1110  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1111  	priv_req =3D to_cdns3_requ=
est(request);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1112  	address =3D priv_ep->endpo=
int.desc->bEndpointAddress;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1113  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1114  	priv_ep->flags |=3D EP_PEN=
DING_REQUEST;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1115  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1116  	/* must allocate buffer al=
igned to 8 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1117  	if (priv_req->flags & REQU=
EST_UNALIGNED)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1118  		trb_dma =3D priv_req->ali=
gned_buf->dma;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1119  	else
7733f6c32e36ff Pawel Laszczak 2019-08-26  1120  		trb_dma =3D request->dma;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1121  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1122  	trb =3D priv_ep->trb_pool =
+ priv_ep->enqueue;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1123  	priv_req->start_trb =3D pr=
iv_ep->enqueue;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1124  	priv_req->trb =3D trb;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1125  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1126  	cdns3_select_ep(priv_ep->c=
dns3_dev, address);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1127  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1128  	/* prepare ring */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1129  	if ((priv_ep->enqueue + nu=
m_trb)  >=3D (priv_ep->num_trbs - 1)) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1130  		struct cdns3_trb *link_tr=
b;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1131  		int doorbell, dma_index;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1132  		u32 ch_bit =3D 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1133  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1134  		doorbell =3D !!(readl(&pr=
iv_dev->regs->ep_cmd) & EP_CMD_DRDY);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1135  		dma_index =3D cdns3_get_d=
ma_pos(priv_dev, priv_ep);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1136  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1137  		/* Driver can't update LI=
NK TRB if it is current processed. */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1138  		if (doorbell && dma_index=
 =3D=3D priv_ep->num_trbs - 1) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1139  			priv_ep->flags |=3D EP_D=
EFERRED_DRDY;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1140  			return -ENOBUFS;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1141  		}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1142  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1143  		/*updating C bt in  Link =
TRB before starting DMA*/
7733f6c32e36ff Pawel Laszczak 2019-08-26  1144  		link_trb =3D priv_ep->trb=
_pool + (priv_ep->num_trbs - 1);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1145  		/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  1146  		 * For TRs size equal 2 e=
nabling TRB_CHAIN for epXin causes
7733f6c32e36ff Pawel Laszczak 2019-08-26  1147  		 * that DMA stuck at the =
LINK TRB.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1148  		 * On the other hand, rem=
oving TRB_CHAIN for longer TRs for
7733f6c32e36ff Pawel Laszczak 2019-08-26  1149  		 * epXout cause that DMA =
stuck after handling LINK TRB.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1150  		 * To eliminate this stra=
nge behavioral driver set TRB_CHAIN
7733f6c32e36ff Pawel Laszczak 2019-08-26  1151  		 * bit only for TR size >=
 2.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1152  		 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1153  		if (priv_ep->type =3D=3D =
USB_ENDPOINT_XFER_ISOC ||
7733f6c32e36ff Pawel Laszczak 2019-08-26  1154  		    TRBS_PER_SEGMENT > 2)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1155  			ch_bit =3D TRB_CHAIN;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1156  =

7733f6c32e36ff Pawel Laszczak 2019-08-26 @1157  		link_trb->control =3D ((p=
riv_ep->pcs) ? TRB_CYCLE : 0) |
7733f6c32e36ff Pawel Laszczak 2019-08-26  1158  				    TRB_TYPE(TRB_LINK) =
| TRB_TOGGLE | ch_bit;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1159  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1160  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1161  	if (priv_dev->dev_ver <=3D=
 DEV_VER_V2)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1162  		togle_pcs =3D cdns3_wa1_u=
pdate_guard(priv_ep, trb);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1163  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1164  	/* set incorrect Cycle Bit=
 for first trb*/
7733f6c32e36ff Pawel Laszczak 2019-08-26  1165  	control =3D priv_ep->pcs ?=
 0 : TRB_CYCLE;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1166  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1167  	do {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1168  		u32 length;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1169  		u16 td_size =3D 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1170  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1171  		/* fill TRB */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1172  		control |=3D TRB_TYPE(TRB=
_NORMAL);
7733f6c32e36ff Pawel Laszczak 2019-08-26 @1173  		trb->buffer =3D TRB_BUFFE=
R(request->num_sgs =3D=3D 0
7733f6c32e36ff Pawel Laszczak 2019-08-26  1174  				? trb_dma : request->sg=
[sg_iter].dma_address);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1175  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1176  		if (likely(!request->num_=
sgs))
7733f6c32e36ff Pawel Laszczak 2019-08-26  1177  			length =3D request->leng=
th;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1178  		else
7733f6c32e36ff Pawel Laszczak 2019-08-26  1179  			length =3D request->sg[s=
g_iter].length;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1180  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1181  		if (likely(priv_dev->dev_=
ver >=3D DEV_VER_V2))
7733f6c32e36ff Pawel Laszczak 2019-08-26  1182  			td_size =3D DIV_ROUND_UP=
(length,
7733f6c32e36ff Pawel Laszczak 2019-08-26  1183  					       priv_ep->endpoi=
nt.maxpacket);
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1184  		else if (priv_ep->flags &=
 EP_TDLCHK_EN)
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1185  			total_tdl +=3D DIV_ROUND=
_UP(length,
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1186  					       priv_ep->endpoi=
nt.maxpacket);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1187  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1188  		trb->length =3D TRB_BURST=
_LEN(priv_ep->trb_burst_size) |
7733f6c32e36ff Pawel Laszczak 2019-08-26  1189  					TRB_LEN(length);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1190  		if (priv_dev->gadget.spee=
d =3D=3D USB_SPEED_SUPER)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1191  			trb->length |=3D TRB_TDL=
_SS_SIZE(td_size);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1192  		else
7733f6c32e36ff Pawel Laszczak 2019-08-26  1193  			control |=3D TRB_TDL_HS_=
SIZE(td_size);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1194  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1195  		pcs =3D priv_ep->pcs ? TR=
B_CYCLE : 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1196  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1197  		/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  1198  		 * first trb should be pr=
epared as last to avoid processing
7733f6c32e36ff Pawel Laszczak 2019-08-26  1199  		 *  transfer to early
7733f6c32e36ff Pawel Laszczak 2019-08-26  1200  		 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1201  		if (sg_iter !=3D 0)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1202  			control |=3D pcs;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1203  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1204  		if (priv_ep->type =3D=3D =
USB_ENDPOINT_XFER_ISOC  && !priv_ep->dir) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1205  			control |=3D TRB_IOC | T=
RB_ISP;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1206  		} else {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1207  			/* for last element in T=
D or in SG list */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1208  			if (sg_iter =3D=3D (num_=
trb - 1) && sg_iter !=3D 0)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1209  				control |=3D pcs | TRB_=
IOC | TRB_ISP;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1210  		}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1211  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1212  		if (sg_iter)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1213  			trb->control =3D control;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1214  		else
7733f6c32e36ff Pawel Laszczak 2019-08-26  1215  			priv_req->trb->control =
=3D control;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1216  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1217  		control =3D 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1218  		++sg_iter;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1219  		priv_req->end_trb =3D pri=
v_ep->enqueue;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1220  		cdns3_ep_inc_enq(priv_ep);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1221  		trb =3D priv_ep->trb_pool=
 + priv_ep->enqueue;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1222  	} while (sg_iter < num_trb=
);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1223  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1224  	trb =3D priv_req->trb;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1225  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1226  	priv_req->flags |=3D REQUE=
ST_PENDING;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1227  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1228  	if (sg_iter =3D=3D 1)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1229  		trb->control |=3D TRB_IOC=
 | TRB_ISP;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1230  =

54c4c69f0baa43 Jayshri Pawar  2019-12-13  1231  	if (priv_dev->dev_ver < DE=
V_VER_V2 &&
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1232  	    (priv_ep->flags & EP_T=
DLCHK_EN)) {
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1233  		u16 tdl =3D total_tdl;
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1234  		u16 old_tdl =3D EP_CMD_TD=
L_GET(readl(&priv_dev->regs->ep_cmd));
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1235  =

54c4c69f0baa43 Jayshri Pawar  2019-12-13  1236  		if (tdl > EP_CMD_TDL_MAX)=
 {
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1237  			tdl =3D EP_CMD_TDL_MAX;
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1238  			priv_ep->pending_tdl =3D=
 total_tdl - EP_CMD_TDL_MAX;
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1239  		}
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1240  =

54c4c69f0baa43 Jayshri Pawar  2019-12-13  1241  		if (old_tdl < tdl) {
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1242  			tdl -=3D old_tdl;
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1243  			writel(EP_CMD_TDL_SET(td=
l) | EP_CMD_STDL,
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1244  			       &priv_dev->regs->=
ep_cmd);
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1245  		}
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1246  	}
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1247  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1248  	/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  1249  	 * Memory barrier - cycle =
bit must be set before other filds in trb.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1250  	 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1251  	wmb();
7733f6c32e36ff Pawel Laszczak 2019-08-26  1252  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1253  	/* give the TD to the cons=
umer*/
7733f6c32e36ff Pawel Laszczak 2019-08-26  1254  	if (togle_pcs)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1255  		trb->control =3D  trb->co=
ntrol ^ 1;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1256  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1257  	if (priv_dev->dev_ver <=3D=
 DEV_VER_V2)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1258  		cdns3_wa1_tray_restore_cy=
cle_bit(priv_dev, priv_ep);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1259  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1260  	trace_cdns3_prepare_trb(pr=
iv_ep, priv_req->trb);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1261  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1262  	/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  1263  	 * Memory barrier - Cycle =
Bit must be set before trb->length  and
7733f6c32e36ff Pawel Laszczak 2019-08-26  1264  	 * trb->buffer fields.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1265  	 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1266  	wmb();
7733f6c32e36ff Pawel Laszczak 2019-08-26  1267  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1268  	/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  1269  	 * For DMULT mode we can s=
et address to transfer ring only once after
7733f6c32e36ff Pawel Laszczak 2019-08-26  1270  	 * enabling endpoint.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1271  	 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1272  	if (priv_ep->flags & EP_UP=
DATE_EP_TRBADDR) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1273  		/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  1274  		 * Until SW is not ready =
to handle the OUT transfer the ISO OUT
7733f6c32e36ff Pawel Laszczak 2019-08-26  1275  		 * Endpoint should be dis=
abled (EP_CFG.ENABLE =3D 0).
7733f6c32e36ff Pawel Laszczak 2019-08-26  1276  		 * EP_CFG_ENABLE must be =
set before updating ep_traddr.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1277  		 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1278  		if (priv_ep->type =3D=3D =
USB_ENDPOINT_XFER_ISOC  && !priv_ep->dir &&
7733f6c32e36ff Pawel Laszczak 2019-08-26  1279  		    !(priv_ep->flags & EP=
_QUIRK_ISO_OUT_EN)) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1280  			priv_ep->flags |=3D EP_Q=
UIRK_ISO_OUT_EN;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1281  			cdns3_set_register_bit(&=
priv_dev->regs->ep_cfg,
7733f6c32e36ff Pawel Laszczak 2019-08-26  1282  					       EP_CFG_ENABLE);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1283  		}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1284  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1285  		writel(EP_TRADDR_TRADDR(p=
riv_ep->trb_pool_dma +
7733f6c32e36ff Pawel Laszczak 2019-08-26  1286  					priv_req->start_trb * =
TRB_SIZE),
7733f6c32e36ff Pawel Laszczak 2019-08-26  1287  					&priv_dev->regs->ep_tr=
addr);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1288  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1289  		priv_ep->flags &=3D ~EP_U=
PDATE_EP_TRBADDR;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1290  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1291  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1292  	if (!priv_ep->wa1_set && !=
(priv_ep->flags & EP_STALLED)) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1293  		trace_cdns3_ring(priv_ep);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1294  		/*clearing TRBERR and EP_=
STS_DESCMIS before seting DRDY*/
7733f6c32e36ff Pawel Laszczak 2019-08-26  1295  		writel(EP_STS_TRBERR | EP=
_STS_DESCMIS, &priv_dev->regs->ep_sts);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1296  		writel(EP_CMD_DRDY, &priv=
_dev->regs->ep_cmd);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1297  		trace_cdns3_doorbell_epx(=
priv_ep->name,
7733f6c32e36ff Pawel Laszczak 2019-08-26  1298  					 readl(&priv_dev->regs=
->ep_traddr));
7733f6c32e36ff Pawel Laszczak 2019-08-26  1299  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1300  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1301  	/* WORKAROUND for transiti=
on to L0 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1302  	__cdns3_gadget_wakeup(priv=
_dev);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1303  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1304  	return 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1305  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  1306  =


:::::: The code at line 1173 was first introduced by commit
:::::: 7733f6c32e36ff9d7adadf40001039bf219b1cbe usb: cdns3: Add Cadence USB=
3 DRD Driver

:::::: TO: Pawel Laszczak <pawell@cadence.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6013125141067057427==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
mMsDbVxQL4E5cx3FXNVzBgSx+XxFQBcztbrdOOcIG7Qn1lRlFecsy+DmL9BmiEmLC246X4A2yJPD
NDQn74oBI8Hxofovq/bOZvVZ9QqxRADMq3bfYYZtsQ+32O2Pzm6o/hytl17GZVlBfEIdWCvcN3m6
WTTkNWo/r6ipBipjb1ppjHE7D7dCsi6pE4+oOGo1Z/qdgPo/Vtu1ZUp6sC261AfSBBo7TsGcCNYj
+NsLBI0aOwoyAP3gmGVVodsM9em7K+pwhaw6cqPGq0RfgK/bhHzUdAP/p8des44K6ZDaeowoyyLx
I5COuO4SYKjP359/PL8+vf989ZWOslK1/fnlH0RdVbvm6+227fXGY0URpk0CIXgdskfFzB89QT39
8fTbt+e7zlcYuH4pUnkp66N2OQd9JGTEK4j88/5TJft/jF1Jd9w4kv4ren2aOfRMkkxuBx+YXDJR
IpIUwcykfOFT27Jbb+yyn2x3V//7QQBcsAQoH8qljC8ABvYAEIh4vuOaPd+HfHz5+fINNidC+h//
45IbxrVSRzp2f6VOjBR9LjXr+eLGqqolJTnD3auSFTnTy6D9hr9WwhRxXgEUc0BQu6cssS4gEf3K
cCbSvPUDtku01powNnjhDl+VZpbNk6WZKT/BW9wrKXGrtJmtfuTKFQTv2/5i1wwujyDLB7PzuTnX
2b2jm81sZZF1Fe85m1xcieXb7bc+eSwpOZM3P0ny8k2eurwRdrh0uKeSpXEu546w8u0K68mx7MyP
Gjxcs8E6ACg8IaYDqgzxgCV9KCrf5XZ3KUJBkz32xnFhOI1tldudVtLNG84VrC5nFwrpxCklWl4O
dkkWB5nDCarBF+/xfaDNh7+Xtvl+97tbtbZyxbutUsb7DL8rsRkPmO8Cmy3f4RUu0DjZAtNNSdPf
rOf0t+RMNxs/Tn+zsVLscYjNFW5VShp627I4fF8hjL/Zlmn0W30nfaPvpOhhus2WvpFN6oh2pjCy
U+zvsFtJkyna4zUtsNSJBZmjhTgW+075BeqI9GCy/Yb0se+WPg42sDB2Y0m4gUXukg2awDLi9PPH
l6f++f/uvr/8+eHnK/LMoIS4u9LcZ43R6Upl6SFwy5/Z0uZsH9cBUgwBYOUTQIo0qQSUvSisEFyH
tAgivnILDkdrQkn/LvR8lWPUg83PiUj3oB8CSL1MX4ZEer6pqZhBm/Q7gyr8rIkgy1MbfP32+p+7
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
--===============6013125141067057427==--

