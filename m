Content-Type: multipart/mixed; boundary="===============5860068287142335661=="
MIME-Version: 1.0
From: Scott Branden <scott.branden@broadcom.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 6/7] misc: bcm-vk: add Broadcom VK driver
Date: Tue, 05 May 2020 16:58:03 -0700
Message-ID: <b3e0c534-9e6a-f270-b6af-3658dca1bd42@broadcom.com>
In-Reply-To: <202004221945.LY6x0DQD%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5860068287142335661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

All the kbuild and sparse issues should be resolved in PATCH v4.

On 2020-04-22 4:17 a.m., kbuild test robot wrote:
> Hi Scott,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on driver-core/driver-core-testing]
> [also build test WARNING on next-20200421]
> [cannot apply to char-misc/char-misc-testing kselftest/next linus/master =
v5.7-rc2]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/Scott-Branden/firmware-a=
dd-partial-read-support-in-request_firmware_into_buf/20200422-114528
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-cor=
e.git 55623260bb33e2ab849af76edf2253bc04cb241f
> reproduce:
>          # apt-get install sparse
>          # sparse version: v0.6.1-191-gc51a0382-dirty
>          make ARCH=3Dx86_64 allmodconfig
>          make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
>
> sparse warnings: (new ones prefixed by >>)
>
>>> drivers/misc/bcm-vk/bcm_vk_dev.c:189:15: sparse: sparse: incorrect type=
 in assignment (different address spaces) @@    expected struct bcm_vk_peer=
_log *p_ctl @@    got struct bcm_vk_peer_log *p_ctl @@
>>> drivers/misc/bcm-vk/bcm_vk_dev.c:189:15: sparse:    expected struct bcm=
_vk_peer_log *p_ctl
>>> drivers/misc/bcm-vk/bcm_vk_dev.c:189:15: sparse:    got void [noderef] =
<asn:2> *
>>> drivers/misc/bcm-vk/bcm_vk_dev.c:685:36: sparse: sparse: incorrect type=
 in argument 2 (different address spaces) @@    expected void const [nodere=
f] <asn:1> *from @@    got oderef] <asn:1> *from @@
>>> drivers/misc/bcm-vk/bcm_vk_dev.c:685:36: sparse:    expected void const=
 [noderef] <asn:1> *from
>>> drivers/misc/bcm-vk/bcm_vk_dev.c:685:36: sparse:    got struct vk_image=
 *arg
>     drivers/misc/bcm-vk/bcm_vk_dev.c:780:36: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@    expected void const [node=
ref] <asn:1> *from @@    got oderef] <asn:1> *from @@
>     drivers/misc/bcm-vk/bcm_vk_dev.c:780:36: sparse:    expected void con=
st [noderef] <asn:1> *from
>>> drivers/misc/bcm-vk/bcm_vk_dev.c:780:36: sparse:    got struct vk_reset=
 *arg
>>> drivers/misc/bcm-vk/bcm_vk_dev.c:858:45: sparse: sparse: incorrect type=
 in argument 2 (different address spaces) @@    expected struct vk_image *a=
rg @@    got void [nstruct vk_image *arg @@
>>> drivers/misc/bcm-vk/bcm_vk_dev.c:858:45: sparse:    expected struct vk_=
image *arg
>>> drivers/misc/bcm-vk/bcm_vk_dev.c:858:45: sparse:    got void [noderef] =
<asn:1> *argp
>>> drivers/misc/bcm-vk/bcm_vk_dev.c:862:40: sparse: sparse: incorrect type=
 in argument 2 (different address spaces) @@    expected struct vk_reset *a=
rg @@    got void [nstruct vk_reset *arg @@
>>> drivers/misc/bcm-vk/bcm_vk_dev.c:862:40: sparse:    expected struct vk_=
reset *arg
>     drivers/misc/bcm-vk/bcm_vk_dev.c:862:40: sparse:    got void [noderef=
] <asn:1> *argp
> --
>>> drivers/misc/bcm-vk/bcm_vk_msg.c:507:17: sparse: sparse: cast removes a=
ddress space '<asn:2>' of expression
>     drivers/misc/bcm-vk/bcm_vk_msg.c:707:15: sparse: sparse: cast removes=
 address space '<asn:2>' of expression
>     drivers/misc/bcm-vk/bcm_vk_msg.c:715:23: sparse: sparse: cast removes=
 address space '<asn:2>' of expression
>     drivers/misc/bcm-vk/bcm_vk_msg.c:871:31: sparse: sparse: cast removes=
 address space '<asn:2>' of expression
>     drivers/misc/bcm-vk/bcm_vk_msg.c:899:47: sparse: sparse: cast removes=
 address space '<asn:2>' of expression
>
> vim +189 drivers/misc/bcm-vk/bcm_vk_dev.c
>
>     180	=

>     181	static void bcm_vk_dump_peer_log(struct bcm_vk *vk)
>     182	{
>     183		struct bcm_vk_peer_log log, *p_ctl;
>     184		char loc_buf[BCM_VK_PEER_LOG_LINE_MAX];
>     185		int cnt;
>     186		struct device *dev =3D &vk->pdev->dev;
>     187		uint data_offset;
>     188	=

>   > 189		p_ctl =3D vk->bar[BAR_2] + vk->peerlog_off;
>     190		log =3D *p_ctl;
>     191		/* do a rmb() to make sure log is updated */
>     192		rmb();
>     193	=

>     194		dev_dbg(dev, "Peer PANIC: Size 0x%x(0x%x), [Rd Wr] =3D [%d %d]\n=
",
>     195			log.buf_size, log.mask, log.rd_idx, log.wr_idx);
>     196	=

>     197		cnt =3D 0;
>     198		data_offset =3D vk->peerlog_off + sizeof(struct bcm_vk_peer_log);
>     199		while (log.rd_idx !=3D log.wr_idx) {
>     200			loc_buf[cnt] =3D vkread8(vk, BAR_2, data_offset + log.rd_idx);
>     201	=

>     202			if ((loc_buf[cnt] =3D=3D '\0') ||
>     203			    (cnt =3D=3D (BCM_VK_PEER_LOG_LINE_MAX - 1))) {
>     204				dev_err(dev, "%s", loc_buf);
>     205				cnt =3D 0;
>     206			} else {
>     207				cnt++;
>     208			}
>     209			log.rd_idx =3D (log.rd_idx + 1) & log.mask;
>     210		}
>     211		/* update rd idx at the end */
>     212		vkwrite32(vk, log.rd_idx, BAR_2, vk->peerlog_off);
>     213	}
>     214	=

>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5860068287142335661==--

