Content-Type: multipart/mixed; boundary="===============4898203090654696223=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH RFC v4 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
Date: Thu, 27 Feb 2020 05:17:00 +0800
Message-ID: <202002270510.FTzVw2TZ%lkp@intel.com>
In-Reply-To: <1582710377-15489-7-git-send-email-kevin3.tang@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4898203090654696223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kevin,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v5.6-rc3]
[cannot apply to next-20200226]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Kevin-Tang/Add-Unisoc-s-dr=
m-kms-module/20200226-202320
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:22:30: sparse: sparse: inc=
orrect type in argument 1 (different address spaces)
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:22:30: sparse:    expected=
 void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:22:30: sparse:    got unio=
n _0x00 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:42:25: sparse: sparse: inc=
orrect type in argument 2 (different address spaces)
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:42:25: sparse:    expected=
 void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:42:25: sparse:    got unio=
n _0x04 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:53:20: sparse: sparse: inc=
orrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:53:20: sparse:    expected=
 void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:53:20: sparse:    got unio=
n _0x18 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:64:20: sparse: sparse: inc=
orrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:64:20: sparse:    expected=
 void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:64:20: sparse:    got unio=
n _0x18 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:71:23: sparse: sparse: inc=
orrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:71:23: sparse:    expected=
 void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:71:23: sparse:    got unio=
n _0x18 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:83:41: sparse: sparse: inc=
orrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:83:41: sparse:    expected=
 void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:83:41: sparse:    got unio=
n _0x1C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:86:41: sparse: sparse: inc=
orrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:86:41: sparse:    expected=
 void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:86:41: sparse:    got unio=
n _0x1C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:98:41: sparse: sparse: inc=
orrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:98:41: sparse:    expected=
 void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:98:41: sparse:    got unio=
n _0x1C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:101:41: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:101:41: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:101:41: sparse:    got uni=
on _0x1C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:114:35: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:114:35: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:114:35: sparse:    got uni=
on _0x38 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:117:35: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:117:35: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:117:35: sparse:    got uni=
on _0x38 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:130:39: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:130:39: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:130:39: sparse:    got uni=
on _0x20 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:133:39: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:133:39: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:133:39: sparse:    got uni=
on _0x20 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:145:39: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:145:39: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:145:39: sparse:    got uni=
on _0x20 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:148:39: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:148:39: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:148:39: sparse:    got uni=
on _0x20 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:160:38: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:160:38: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:160:38: sparse:    got uni=
on _0x2C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:163:38: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:163:38: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:163:38: sparse:    got uni=
on _0x2C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:175:43: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:175:43: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:175:43: sparse:    got uni=
on _0x28 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:178:43: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:178:43: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:178:43: sparse:    got uni=
on _0x28 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:190:43: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:190:43: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:190:43: sparse:    got uni=
on _0x28 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:193:43: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:193:43: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:193:43: sparse:    got uni=
on _0x28 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:205:41: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:205:41: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:205:41: sparse:    got uni=
on _0x34 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:208:41: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:208:41: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:208:41: sparse:    got uni=
on _0x34 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:220:39: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:220:39: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:220:39: sparse:    got uni=
on _0x30 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:223:39: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:223:39: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:223:39: sparse:    got uni=
on _0x30 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:235:39: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:235:39: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:235:39: sparse:    got uni=
on _0x30 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:238:39: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:238:39: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:238:39: sparse:    got uni=
on _0x30 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:250:39: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:250:39: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:250:39: sparse:    got uni=
on _0x30 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:253:39: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:253:39: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:253:39: sparse:    got uni=
on _0x30 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:266:35: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:266:35: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:266:35: sparse:    got uni=
on _0x38 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:271:35: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:271:35: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:271:35: sparse:    got uni=
on _0x38 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:284:35: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:284:35: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:284:35: sparse:    got uni=
on _0x38 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:291:35: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:291:35: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:291:35: sparse:    got uni=
on _0x38 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:303:35: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:303:35: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:303:35: sparse:    got uni=
on _0x38 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:306:35: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:306:35: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:306:35: sparse:    got uni=
on _0x38 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:319:39: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:319:39: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:319:39: sparse:    got uni=
on _0x24 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:322:39: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:322:39: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:322:39: sparse:    got uni=
on _0x24 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:336:41: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:336:41: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:336:41: sparse:    got uni=
on _0xC0 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:339:41: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:339:41: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:339:41: sparse:    got uni=
on _0xC0 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:352:39: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:352:39: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:352:39: sparse:    got uni=
on _0x24 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:355:39: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:355:39: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:355:39: sparse:    got uni=
on _0x24 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:368:38: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:368:38: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:368:38: sparse:    got uni=
on _0xC4 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:371:38: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:371:38: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:371:38: sparse:    got uni=
on _0xC4 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:383:35: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:383:35: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:383:35: sparse:    got uni=
on _0x68 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:386:35: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:386:35: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:386:35: sparse:    got uni=
on _0x68 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:398:35: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:398:35: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:398:35: sparse:    got uni=
on _0x68 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:401:35: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:401:35: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:401:35: sparse:    got uni=
on _0x68 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:415:35: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:415:35: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:415:35: sparse:    got uni=
on _0x68 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:431:35: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:431:35: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:431:35: sparse:    got uni=
on _0x68 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:445:35: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:445:35: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:445:35: sparse:    got uni=
on _0x38 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:448:35: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:448:35: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:448:35: sparse:    got uni=
on _0x38 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:475:30: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:475:30: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:475:30: sparse:    got uni=
on _0x6C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:487:26: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:487:26: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:487:26: sparse:    got uni=
on _0x70 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:499:23: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:499:23: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:499:23: sparse:    got uni=
on _0x70 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:511:25: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:511:25: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:511:25: sparse:    got uni=
on _0xB8 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:523:30: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:523:30: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:523:30: sparse:    got uni=
on _0xBC *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:526:30: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:526:30: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:526:30: sparse:    got uni=
on _0xBC *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:538:30: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:538:30: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:538:30: sparse:    got uni=
on _0xBC *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:541:30: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:541:30: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:541:30: sparse:    got uni=
on _0xBC *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:553:42: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:553:42: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:553:42: sparse:    got uni=
on _0xB4 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:556:42: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:556:42: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:556:42: sparse:    got uni=
on _0xB4 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:568:42: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:568:42: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:568:42: sparse:    got uni=
on _0xB4 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:571:42: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:571:42: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:571:42: sparse:    got uni=
on _0xB4 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:585:38: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:585:38: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:585:38: sparse:    got uni=
on _0x98 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:599:38: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:599:38: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:599:38: sparse:    got uni=
on _0x98 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:613:38: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:613:38: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:613:38: sparse:    got uni=
on _0x98 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:627:38: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:627:38: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:627:38: sparse:    got uni=
on _0x98 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:641:38: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:641:38: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:641:38: sparse:    got uni=
on _0x98 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:655:38: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:655:38: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:655:38: sparse:    got uni=
on _0x98 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:669:38: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:669:38: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:669:38: sparse:    got uni=
on _0x98 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:686:45: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:686:45: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:686:45: sparse:    got uni=
on _0xD0 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:689:45: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:689:45: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:689:45: sparse:    got uni=
on _0xD0 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:703:47: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:703:47: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:703:47: sparse:    got uni=
on _0xAC *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:706:47: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:706:47: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:706:47: sparse:    got uni=
on _0xAC *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:720:47: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:720:47: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:720:47: sparse:    got uni=
on _0xAC *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:723:47: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:723:47: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:723:47: sparse:    got uni=
on _0xAC *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:737:46: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:737:46: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:737:46: sparse:    got uni=
on _0xA8 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:740:46: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:740:46: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:740:46: sparse:    got uni=
on _0xA8 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:754:46: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:754:46: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:754:46: sparse:    got uni=
on _0xA8 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:757:46: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:757:46: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:757:46: sparse:    got uni=
on _0xA8 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:770:29: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:770:29: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:770:29: sparse:    got uni=
on _0xB0 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:784:43: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:784:43: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:784:43: sparse:    got uni=
on _0x74 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:787:43: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:787:43: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:787:43: sparse:    got uni=
on _0x74 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:800:22: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:800:22: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:800:22: sparse:    got uni=
on _0x5C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:813:22: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:813:22: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:813:22: sparse:    got uni=
on _0x40 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:824:29: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:824:29: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:824:29: sparse:    got uni=
on _0x48 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:835:29: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:835:29: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:835:29: sparse:    got uni=
on _0x44 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:848:29: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:848:29: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:848:29: sparse:    got uni=
on _0x58 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:862:29: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:862:29: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:862:29: sparse:    got uni=
on _0x54 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:877:41: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:877:41: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:877:41: sparse:    got uni=
on _0x4C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:880:41: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:880:41: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:880:41: sparse:    got uni=
on _0x4C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:895:43: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:895:43: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:895:43: sparse:    got uni=
on _0x50 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:898:43: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:898:43: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:898:43: sparse:    got uni=
on _0x50 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:912:41: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:912:41: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:912:41: sparse:    got uni=
on _0x4C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:915:41: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:915:41: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:915:41: sparse:    got uni=
on _0x4C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:928:39: sparse: sparse: in=
correct type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:928:39: sparse:    expecte=
d void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:928:39: sparse:    got uni=
on _0x08 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:929:39: sparse: sparse: in=
correct type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:929:39: sparse:    expecte=
d void volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:929:39: sparse:    got uni=
on _0xC8 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:1008:39: sparse: sparse: i=
ncorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:1008:39: sparse:    expect=
ed void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:1008:39: sparse:    got un=
ion _0x10 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:1009:39: sparse: sparse: i=
ncorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:1009:39: sparse:    expect=
ed void volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:1009:39: sparse:    got un=
ion _0xCC *
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c:1064:20: sparse: sparse: t=
oo many warnings
--
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:24:41: sparse: sparse:=
 incorrect type in argument 1 (different address spaces)
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:24:41: sparse:    expe=
cted void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:24:41: sparse:    got =
union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:27:41: sparse: sparse:=
 incorrect type in argument 2 (different address spaces)
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:27:41: sparse:    expe=
cted void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:27:41: sparse:    got =
union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:41:41: sparse: sparse:=
 incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:41:41: sparse:    expe=
cted void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:41:41: sparse:    got =
union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:44:41: sparse: sparse:=
 incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:44:41: sparse:    expe=
cted void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:44:41: sparse:    got =
union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:59:41: sparse: sparse:=
 incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:59:41: sparse:    expe=
cted void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:59:41: sparse:    got =
union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:62:41: sparse: sparse:=
 incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:62:41: sparse:    expe=
cted void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:62:41: sparse:    got =
union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:70:41: sparse: sparse:=
 incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:70:41: sparse:    expe=
cted void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:70:41: sparse:    got =
union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:73:41: sparse: sparse:=
 incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:73:41: sparse:    expe=
cted void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:73:41: sparse:    got =
union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:81:41: sparse: sparse:=
 incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:81:41: sparse:    expe=
cted void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:81:41: sparse:    got =
union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:84:41: sparse: sparse:=
 incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:84:41: sparse:    expe=
cted void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:84:41: sparse:    got =
union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:92:41: sparse: sparse:=
 incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:92:41: sparse:    expe=
cted void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:92:41: sparse:    got =
union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:95:41: sparse: sparse:=
 incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:95:41: sparse:    expe=
cted void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:95:41: sparse:    got =
union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:103:41: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:103:41: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:103:41: sparse:    got=
 union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:106:41: sparse: sparse=
: incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:106:41: sparse:    exp=
ected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:106:41: sparse:    got=
 union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:119:29: sparse: sparse=
: incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:119:29: sparse:    exp=
ected void volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:119:29: sparse:    got=
 union _0xA0 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:132:33: sparse: sparse=
: incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:132:33: sparse:    exp=
ected void volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:132:33: sparse:    got=
 union _0xA4 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:146:41: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:146:41: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:146:41: sparse:    got=
 union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:149:41: sparse: sparse=
: incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:149:41: sparse:    exp=
ected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:149:41: sparse:    got=
 union _0x78 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:167:43: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:167:43: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:167:43: sparse:    got=
 union _0x74 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:171:43: sparse: sparse=
: incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:171:43: sparse:    exp=
ected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:171:43: sparse:    got=
 union _0x74 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:186:33: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:186:33: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:186:33: sparse:    got=
 union _0x9C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:196:33: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:196:33: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:196:33: sparse:    got=
 union _0x9C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:206:33: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:206:33: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:206:33: sparse:    got=
 union _0x9C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:217:33: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:217:33: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:217:33: sparse:    got=
 union _0x9C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:236:33: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:236:33: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:236:33: sparse:    got=
 union _0x9C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:247:33: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:247:33: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:247:33: sparse:    got=
 union _0x9C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:266:33: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:266:33: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:266:33: sparse:    got=
 union _0x9C *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:281:36: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:281:36: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:281:36: sparse:    got=
 union _0xF0 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:284:36: sparse: sparse=
: incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:284:36: sparse:    exp=
ected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:284:36: sparse:    got=
 union _0xF0 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:297:36: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:297:36: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:297:36: sparse:    got=
 union _0xF0 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:300:36: sparse: sparse=
: incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:300:36: sparse:    exp=
ected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:300:36: sparse:    got=
 union _0xF0 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:313:36: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:313:36: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:313:36: sparse:    got=
 union _0xF4 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:316:36: sparse: sparse=
: incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:316:36: sparse:    exp=
ected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:316:36: sparse:    got=
 union _0xF4 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:328:36: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:328:36: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:328:36: sparse:    got=
 union _0xF4 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:343:36: sparse: sparse=
: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:343:36: sparse:    exp=
ected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:343:36: sparse:    got=
 union _0xF4 *
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:346:36: sparse: sparse=
: incorrect type in argument 2 (different address spaces)
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:346:36: sparse:    exp=
ected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c:346:36: sparse:    got=
 union _0xF4 *

vim +22 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c

    13	=

    14	/*
    15	 * Get DSI Host core version
    16	 * @param instance pointer to structure holding the DSI Host core in=
formation
    17	 * @return ascii number of the version
    18	 */
    19	static bool dsi_check_version(struct dsi_context *ctx)
    20	{
    21		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
  > 22		u32 version =3D readl(&reg->DSI_VERSION);
    23	=

    24		if (version =3D=3D 0x100)
    25			return true;
    26		else if (version =3D=3D 0x200)
    27			return true;
    28		else if (version =3D=3D 0x300)
    29			return true;
    30		else
    31			return false;
    32	}
    33	/*
    34	 * Modify power status of DSI Host core
    35	 * @param instance pointer to structure holding the DSI Host core in=
formation
    36	 * @param on (1) or off (0)
    37	 */
    38	static void dsi_power_enable(struct dsi_context *ctx, int enable)
    39	{
    40		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
    41	=

  > 42		writel(enable, &reg->SOFT_RESET);
    43	}
    44	/*
    45	 * Enable/disable DPI video mode
    46	 * @param instance pointer to structure holding the DSI Host core in=
formation
    47	 * @param enable (1) - disable (0)
    48	 */
    49	static void dsi_video_mode(struct dsi_context *ctx)
    50	{
    51		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
    52	=

  > 53		writel(0, &reg->DSI_MODE_CFG);
    54	}
    55	/*
    56	 * Enable command mode (Generic interface)
    57	 * @param instance pointer to structure holding the DSI Host core in=
formation
    58	 * @param enable
    59	 */
    60	static void dsi_cmd_mode(struct dsi_context *ctx)
    61	{
    62		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
    63	=

    64		writel(1, &reg->DSI_MODE_CFG);
    65	}
    66	=

    67	static bool dsi_is_cmd_mode(struct dsi_context *ctx)
    68	{
    69		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
    70	=

    71		return readl(&reg->DSI_MODE_CFG);
    72	}
    73	/*
    74	 * Configure the read back virtual channel for the generic interface
    75	 * @param instance pointer to structure holding the DSI Host core in=
formation
    76	 * @param vc to listen to on the line
    77	 */
    78	static void dsi_rx_vcid(struct dsi_context *ctx, u8 vc)
    79	{
    80		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
    81		union _0x1C virtual_channel_id;
    82	=

  > 83		virtual_channel_id.val =3D readl(&reg->VIRTUAL_CHANNEL_ID);
    84		virtual_channel_id.bits.gen_rx_vcid =3D vc;
    85	=

    86		writel(virtual_channel_id.val, &reg->VIRTUAL_CHANNEL_ID);
    87	}
    88	/*
    89	 * Write the DPI video virtual channel destination
    90	 * @param instance pointer to structure holding the DSI Host core in=
formation
    91	 * @param vc virtual channel
    92	 */
    93	static void dsi_video_vcid(struct dsi_context *ctx, u8 vc)
    94	{
    95		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
    96		union _0x1C virtual_channel_id;
    97	=

    98		virtual_channel_id.val =3D readl(&reg->VIRTUAL_CHANNEL_ID);
    99		virtual_channel_id.bits.video_pkt_vcid =3D vc;
   100	=

   101		writel(virtual_channel_id.val, &reg->VIRTUAL_CHANNEL_ID);
   102	}
   103	/*
   104	 * Set DPI video mode type (burst/non-burst - with sync pulses or ev=
ents)
   105	 * @param instance pointer to structure holding the DSI Host core in=
formation
   106	 * @param type
   107	 * @return error code
   108	 */
   109	static void dsi_dpi_video_burst_mode(struct dsi_context *ctx, int mo=
de)
   110	{
   111		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   112		union _0x38 vid_mode_cfg;
   113	=

   114		vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
   115		vid_mode_cfg.bits.vid_mode_type =3D mode;
   116	=

   117		writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
   118	}
   119	/*
   120	 * Set DPI video color coding
   121	 * @param instance pointer to structure holding the DSI Host core in=
formation
   122	 * @param color_coding enum (configuration and color depth)
   123	 * @return error code
   124	 */
   125	static void dsi_dpi_color_coding(struct dsi_context *ctx, int coding)
   126	{
   127		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   128		union _0x20 dpi_video_format;
   129	=

   130		dpi_video_format.val =3D readl(&reg->DPI_VIDEO_FORMAT);
   131		dpi_video_format.bits.dpi_video_mode_format =3D coding;
   132	=

   133		writel(dpi_video_format.val, &reg->DPI_VIDEO_FORMAT);
   134	}
   135	/*
   136	 * Set DPI loosely packetisation video (used only when color depth =
=3D 18
   137	 * @param instance pointer to structure holding the DSI Host core in=
formation
   138	 * @param enable
   139	 */
   140	static void dsi_dpi_18_loosely_packet_en(struct dsi_context *ctx, in=
t enable)
   141	{
   142		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   143		union _0x20 dpi_video_format;
   144	=

   145		dpi_video_format.val =3D readl(&reg->DPI_VIDEO_FORMAT);
   146		dpi_video_format.bits.loosely18_en =3D enable;
   147	=

   148		writel(dpi_video_format.val, &reg->DPI_VIDEO_FORMAT);
   149	}
   150	/*
   151	 * Configure the Horizontal Line time
   152	 * @param instance pointer to structure holding the DSI Host core in=
formation
   153	 * @param byte_cycle taken to transmit the total of the horizontal l=
ine
   154	 */
   155	static void dsi_dpi_hline_time(struct dsi_context *ctx, u16 byte_cyc=
le)
   156	{
   157		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   158		union _0x2C video_line_time;
   159	=

   160		video_line_time.val =3D readl(&reg->VIDEO_LINE_TIME);
   161		video_line_time.bits.video_line_time =3D byte_cycle;
   162	=

   163		writel(video_line_time.val, &reg->VIDEO_LINE_TIME);
   164	}
   165	/*
   166	 * Configure the Horizontal back porch time
   167	 * @param instance pointer to structure holding the DSI Host core in=
formation
   168	 * @param byte_cycle taken to transmit the horizontal back porch
   169	 */
   170	static void dsi_dpi_hbp_time(struct dsi_context *ctx, u16 byte_cycle)
   171	{
   172		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   173		union _0x28 video_line_hblk_time;
   174	=

   175		video_line_hblk_time.val =3D readl(&reg->VIDEO_LINE_HBLK_TIME);
   176		video_line_hblk_time.bits.video_line_hbp_time =3D byte_cycle;
   177	=

   178		writel(video_line_hblk_time.val, &reg->VIDEO_LINE_HBLK_TIME);
   179	}
   180	/*
   181	 * Configure the Horizontal sync time
   182	 * @param instance pointer to structure holding the DSI Host core in=
formation
   183	 * @param byte_cycle taken to transmit the horizontal sync
   184	 */
   185	static void dsi_dpi_hsync_time(struct dsi_context *ctx, u16 byte_cyc=
le)
   186	{
   187		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   188		union _0x28 video_line_hblk_time;
   189	=

   190		video_line_hblk_time.val =3D readl(&reg->VIDEO_LINE_HBLK_TIME);
   191		video_line_hblk_time.bits.video_line_hsa_time =3D byte_cycle;
   192	=

   193		writel(video_line_hblk_time.val, &reg->VIDEO_LINE_HBLK_TIME);
   194	}
   195	/*
   196	 * Configure the vertical active lines of the video stream
   197	 * @param instance pointer to structure holding the DSI Host core in=
formation
   198	 * @param lines
   199	 */
   200	static void dsi_dpi_vact(struct dsi_context *ctx, u16 lines)
   201	{
   202		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   203		union _0x34 video_active_lines;
   204	=

   205		video_active_lines.val =3D readl(&reg->VIDEO_VACTIVE_LINES);
   206		video_active_lines.bits.vactive_lines =3D lines;
   207	=

   208		writel(video_active_lines.val, &reg->VIDEO_VACTIVE_LINES);
   209	}
   210	/*
   211	 * Configure the vertical front porch lines of the video stream
   212	 * @param instance pointer to structure holding the DSI Host core in=
formation
   213	 * @param lines
   214	 */
   215	static void dsi_dpi_vfp(struct dsi_context *ctx, u16 lines)
   216	{
   217		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   218		union _0x30 video_vblk_lines;
   219	=

   220		video_vblk_lines.val =3D readl(&reg->VIDEO_VBLK_LINES);
   221		video_vblk_lines.bits.vfp_lines =3D lines;
   222	=

   223		writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
   224	}
   225	/*
   226	 * Configure the vertical back porch lines of the video stream
   227	 * @param instance pointer to structure holding the DSI Host core in=
formation
   228	 * @param lines
   229	 */
   230	static void dsi_dpi_vbp(struct dsi_context *ctx, u16 lines)
   231	{
   232		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   233		union _0x30 video_vblk_lines;
   234	=

   235		video_vblk_lines.val =3D readl(&reg->VIDEO_VBLK_LINES);
   236		video_vblk_lines.bits.vbp_lines =3D lines;
   237	=

   238		writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
   239	}
   240	/*
   241	 * Configure the vertical sync lines of the video stream
   242	 * @param instance pointer to structure holding the DSI Host core in=
formation
   243	 * @param lines
   244	 */
   245	static void dsi_dpi_vsync(struct dsi_context *ctx, u16 lines)
   246	{
   247		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   248		union _0x30 video_vblk_lines;
   249	=

   250		video_vblk_lines.val =3D readl(&reg->VIDEO_VBLK_LINES);
   251		video_vblk_lines.bits.vsa_lines =3D lines;
   252	=

   253		writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
   254	}
   255	/*
   256	 * Enable return to low power mode inside horizontal front porch per=
iods when
   257	 *  timing allows
   258	 * @param instance pointer to structure holding the DSI Host core in=
formation
   259	 * @param enable (1) - disable (0)
   260	 */
   261	static void dsi_dpi_hporch_lp_en(struct dsi_context *ctx, int enable)
   262	{
   263		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   264		union _0x38 vid_mode_cfg;
   265	=

   266		vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
   267	=

   268		vid_mode_cfg.bits.lp_hfp_en =3D enable;
   269		vid_mode_cfg.bits.lp_hbp_en =3D enable;
   270	=

   271		writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
   272	}
   273	/*
   274	 * Enable return to low power mode inside vertical active lines peri=
ods when
   275	 *  timing allows
   276	 * @param instance pointer to structure holding the DSI Host core in=
formation
   277	 * @param enable (1) - disable (0)
   278	 */
   279	static void dsi_dpi_vporch_lp_en(struct dsi_context *ctx, int enable)
   280	{
   281		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   282		union _0x38 vid_mode_cfg;
   283	=

   284		vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
   285	=

   286		vid_mode_cfg.bits.lp_vact_en =3D enable;
   287		vid_mode_cfg.bits.lp_vfp_en =3D enable;
   288		vid_mode_cfg.bits.lp_vbp_en =3D enable;
   289		vid_mode_cfg.bits.lp_vsa_en =3D enable;
   290	=

   291		writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
   292	}
   293	/*
   294	 * Enable FRAME BTA ACK
   295	 * @param instance pointer to structure holding the DSI Host core in=
formation
   296	 * @param enable (1) - disable (0)
   297	 */
   298	static void dsi_dpi_frame_ack_en(struct dsi_context *ctx, int enable)
   299	{
   300		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   301		union _0x38 vid_mode_cfg;
   302	=

   303		vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
   304		vid_mode_cfg.bits.frame_bta_ack_en =3D enable;
   305	=

   306		writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
   307	}
   308	/*
   309	 * Write no of chunks to core - taken into consideration only when m=
ulti packet
   310	 * is enabled
   311	 * @param instance pointer to structure holding the DSI Host core in=
formation
   312	 * @param no of chunks
   313	 */
   314	static void dsi_dpi_chunk_num(struct dsi_context *ctx, u16 num)
   315	{
   316		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   317		union _0x24 video_pkt_config;
   318	=

   319		video_pkt_config.val =3D readl(&reg->VIDEO_PKT_CONFIG);
   320		video_pkt_config.bits.video_line_chunk_num =3D num;
   321	=

   322		writel(video_pkt_config.val, &reg->VIDEO_PKT_CONFIG);
   323	}
   324	/*
   325	 * Write the null packet size - will only be taken into account when=
 null
   326	 * packets are enabled.
   327	 * @param instance pointer to structure holding the DSI Host core in=
formation
   328	 * @param size of null packet
   329	 * @return error code
   330	 */
   331	static void dsi_dpi_null_packet_size(struct dsi_context *ctx, u16 si=
ze)
   332	{
   333		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   334		union _0xC0 video_nullpkt_size;
   335	=

   336		video_nullpkt_size.val =3D readl(&reg->VIDEO_NULLPKT_SIZE);
   337		video_nullpkt_size.bits.video_nullpkt_size =3D size;
   338	=

   339		writel(video_nullpkt_size.val, &reg->VIDEO_NULLPKT_SIZE);
   340	}
   341	/*
   342	 * Write video packet size. obligatory for sending video
   343	 * @param instance pointer to structure holding the DSI Host core in=
formation
   344	 * @param size of video packet - containing information
   345	 * @return error code
   346	 */
   347	static void dsi_dpi_video_packet_size(struct dsi_context *ctx, u16 s=
ize)
   348	{
   349		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   350		union _0x24 video_pkt_config;
   351	=

   352		video_pkt_config.val =3D readl(&reg->VIDEO_PKT_CONFIG);
   353		video_pkt_config.bits.video_pkt_size =3D size;
   354	=

   355		writel(video_pkt_config.val, &reg->VIDEO_PKT_CONFIG);
   356	}
   357	/*
   358	 * Specifiy the size of the packet memory write start/continue
   359	 * @param instance pointer to structure holding the DSI Host core in=
formation
   360	 * @ size of the packet
   361	 * @note when different than zero (0) eDPI is enabled
   362	 */
   363	static void dsi_edpi_max_pkt_size(struct dsi_context *ctx, u16 size)
   364	{
   365		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   366		union _0xC4 dcs_wm_pkt_size;
   367	=

   368		dcs_wm_pkt_size.val =3D readl(&reg->DCS_WM_PKT_SIZE);
   369		dcs_wm_pkt_size.bits.dcs_wm_pkt_size =3D size;
   370	=

   371		writel(dcs_wm_pkt_size.val, &reg->DCS_WM_PKT_SIZE);
   372	}
   373	/*
   374	 * Enable tear effect acknowledge
   375	 * @param instance pointer to structure holding the DSI Host core in=
formation
   376	 * @param enable (1) - disable (0)
   377	 */
   378	static void dsi_tear_effect_ack_en(struct dsi_context *ctx, int enab=
le)
   379	{
   380		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   381		union _0x68 cmd_mode_cfg;
   382	=

   383		cmd_mode_cfg.val =3D readl(&reg->CMD_MODE_CFG);
   384		cmd_mode_cfg.bits.tear_fx_en =3D enable;
   385	=

   386		writel(cmd_mode_cfg.val, &reg->CMD_MODE_CFG);
   387	}
   388	/*
   389	 * Enable packets acknowledge request after each packet transmission
   390	 * @param instance pointer to structure holding the DSI Host core in=
formation
   391	 * @param enable (1) - disable (0)
   392	 */
   393	static void dsi_cmd_ack_request_en(struct dsi_context *ctx, int enab=
le)
   394	{
   395		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   396		union _0x68 cmd_mode_cfg;
   397	=

   398		cmd_mode_cfg.val =3D readl(&reg->CMD_MODE_CFG);
   399		cmd_mode_cfg.bits.ack_rqst_en =3D enable;
   400	=

   401		writel(cmd_mode_cfg.val, &reg->CMD_MODE_CFG);
   402	}
   403	/*
   404	 * Set DCS command packet transmission to transmission type
   405	 * @param instance pointer to structure holding the DSI Host core in=
formation
   406	 * @param no_of_param of command
   407	 * @param lp transmit in low power
   408	 * @return error code
   409	 */
   410	static void dsi_cmd_mode_lp_cmd_en(struct dsi_context *ctx, int enab=
le)
   411	{
   412		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   413		union _0x68 cmd_mode_cfg;
   414	=

   415		cmd_mode_cfg.val =3D readl(&reg->CMD_MODE_CFG);
   416	=

   417		cmd_mode_cfg.bits.gen_sw_0p_tx =3D enable;
   418		cmd_mode_cfg.bits.gen_sw_1p_tx =3D enable;
   419		cmd_mode_cfg.bits.gen_sw_2p_tx =3D enable;
   420		cmd_mode_cfg.bits.gen_lw_tx =3D enable;
   421		cmd_mode_cfg.bits.dcs_sw_0p_tx =3D enable;
   422		cmd_mode_cfg.bits.dcs_sw_1p_tx =3D enable;
   423		cmd_mode_cfg.bits.dcs_lw_tx =3D enable;
   424		cmd_mode_cfg.bits.max_rd_pkt_size =3D enable;
   425	=

   426		cmd_mode_cfg.bits.gen_sr_0p_tx =3D enable;
   427		cmd_mode_cfg.bits.gen_sr_1p_tx =3D enable;
   428		cmd_mode_cfg.bits.gen_sr_2p_tx =3D enable;
   429		cmd_mode_cfg.bits.dcs_sr_0p_tx =3D enable;
   430	=

   431		writel(cmd_mode_cfg.val, &reg->CMD_MODE_CFG);
   432	}
   433	/*
   434	 * Set DCS read command packet transmission to transmission type
   435	 * @param instance pointer to structure holding the DSI Host core in=
formation
   436	 * @param no_of_param of command
   437	 * @param lp transmit in low power
   438	 * @return error code
   439	 */
   440	static void dsi_video_mode_lp_cmd_en(struct dsi_context *ctx, int en=
able)
   441	{
   442		struct dsi_reg *reg =3D (struct dsi_reg *)ctx->base;
   443		union _0x38 vid_mode_cfg;
   444	=

   445		vid_mode_cfg.val =3D readl(&reg->VID_MODE_CFG);
   446		vid_mode_cfg.bits.lp_cmd_en =3D enable;
   447	=

   448		writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
   449	}
   450	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4898203090654696223==--

