Content-Type: multipart/mixed; boundary="===============2484538060510155216=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 6/7] misc: bcm-vk: add Broadcom VK driver
Date: Sun, 23 Feb 2020 00:44:49 +0800
Message-ID: <202002230019.zc13SqPI%lkp@intel.com>
In-Reply-To: <20200220004825.23372-7-scott.branden@broadcom.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2484538060510155216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Scott,

I love your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on kselftest/next linus/master v5.6-rc2]
[cannot apply to driver-core/driver-core-testing next-20200221]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Scott-Branden/firmware-add=
-partial-read-support-in-request_firmware_into_buf/20200222-032851
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t 06e33595e96f212811066df192ae8bf802174296
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/misc/bcm-vk/bcm_vk_dev.c:34:29: sparse: sparse: symbol 'image_ta=
b' was not declared. Should it be static?
>> drivers/misc/bcm-vk/bcm_vk_dev.c:185:15: sparse: sparse: incorrect type =
in assignment (different address spaces)
>> drivers/misc/bcm-vk/bcm_vk_dev.c:185:15: sparse:    expected struct bcm_=
vk_peer_log *p_ctl
>> drivers/misc/bcm-vk/bcm_vk_dev.c:185:15: sparse:    got void [noderef] <=
asn:2> *
   drivers/misc/bcm-vk/bcm_vk_dev.c:415:22: sparse: sparse: incorrect type =
in assignment (different address spaces)
>> drivers/misc/bcm-vk/bcm_vk_dev.c:415:22: sparse:    expected void *bufp
   drivers/misc/bcm-vk/bcm_vk_dev.c:415:22: sparse:    got void [noderef] <=
asn:2> *
>> drivers/misc/bcm-vk/bcm_vk_dev.c:654:36: sparse: sparse: incorrect type =
in argument 2 (different address spaces)
>> drivers/misc/bcm-vk/bcm_vk_dev.c:654:36: sparse:    expected void const =
[noderef] <asn:1> *from
>> drivers/misc/bcm-vk/bcm_vk_dev.c:654:36: sparse:    got struct vk_image =
*arg
   drivers/misc/bcm-vk/bcm_vk_dev.c:694:37: sparse: sparse: incorrect type =
in argument 2 (different address spaces)
   drivers/misc/bcm-vk/bcm_vk_dev.c:694:37: sparse:    expected void const =
[noderef] <asn:1> *from
>> drivers/misc/bcm-vk/bcm_vk_dev.c:694:37: sparse:    got struct vk_access=
 *arg
   drivers/misc/bcm-vk/bcm_vk_dev.c:717:31: sparse: sparse: incorrect type =
in argument 1 (different address spaces)
>> drivers/misc/bcm-vk/bcm_vk_dev.c:717:31: sparse:    expected void const =
volatile [noderef] <asn:1> *
>> drivers/misc/bcm-vk/bcm_vk_dev.c:717:31: sparse:    got unsigned int [us=
ertype] *
   drivers/misc/bcm-vk/bcm_vk_dev.c:728:31: sparse: sparse: incorrect type =
in argument 1 (different address spaces)
   drivers/misc/bcm-vk/bcm_vk_dev.c:728:31: sparse:    expected void const =
volatile [noderef] <asn:1> *
   drivers/misc/bcm-vk/bcm_vk_dev.c:728:31: sparse:    got unsigned int [us=
ertype] *
   drivers/misc/bcm-vk/bcm_vk_dev.c:793:36: sparse: sparse: incorrect type =
in argument 2 (different address spaces)
   drivers/misc/bcm-vk/bcm_vk_dev.c:793:36: sparse:    expected void const =
[noderef] <asn:1> *from
>> drivers/misc/bcm-vk/bcm_vk_dev.c:793:36: sparse:    got struct vk_reset =
*arg
   drivers/misc/bcm-vk/bcm_vk_dev.c:873:45: sparse: sparse: incorrect type =
in argument 2 (different address spaces)
>> drivers/misc/bcm-vk/bcm_vk_dev.c:873:45: sparse:    expected struct vk_i=
mage *arg
>> drivers/misc/bcm-vk/bcm_vk_dev.c:873:45: sparse:    got void [noderef] <=
asn:1> *argp
   drivers/misc/bcm-vk/bcm_vk_dev.c:877:45: sparse: sparse: incorrect type =
in argument 2 (different address spaces)
>> drivers/misc/bcm-vk/bcm_vk_dev.c:877:45: sparse:    expected struct vk_a=
ccess *arg
   drivers/misc/bcm-vk/bcm_vk_dev.c:877:45: sparse:    got void [noderef] <=
asn:1> *argp
   drivers/misc/bcm-vk/bcm_vk_dev.c:881:40: sparse: sparse: incorrect type =
in argument 2 (different address spaces)
>> drivers/misc/bcm-vk/bcm_vk_dev.c:881:40: sparse:    expected struct vk_r=
eset *arg
   drivers/misc/bcm-vk/bcm_vk_dev.c:881:40: sparse:    got void [noderef] <=
asn:1> *argp
--
>> drivers/misc/bcm-vk/bcm_vk_msg.c:102:6: sparse: sparse: symbol 'bcm_vk_u=
pdate_qstats' was not declared. Should it be static?
>> drivers/misc/bcm-vk/bcm_vk_msg.c:455:17: sparse: sparse: cast removes ad=
dress space '<asn:2>' of expression
   drivers/misc/bcm-vk/bcm_vk_msg.c:656:15: sparse: sparse: cast removes ad=
dress space '<asn:2>' of expression
   drivers/misc/bcm-vk/bcm_vk_msg.c:664:23: sparse: sparse: cast removes ad=
dress space '<asn:2>' of expression
>> drivers/misc/bcm-vk/bcm_vk_msg.c:734:5: sparse: sparse: symbol 'bcm_vk_h=
andle_last_sess' was not declared. Should it be static?
   drivers/misc/bcm-vk/bcm_vk_msg.c:823:31: sparse: sparse: cast removes ad=
dress space '<asn:2>' of expression
   drivers/misc/bcm-vk/bcm_vk_msg.c:851:47: sparse: sparse: cast removes ad=
dress space '<asn:2>' of expression

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2484538060510155216==--

