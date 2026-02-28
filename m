Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B02116E0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Feb 2026 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772287252; cv=none; b=YjDuIZwbDVB0m7Y6N5e93bQz2tRV+Zv9t/opk4pRVI74lPXNUu0G2k9ic+wwxtX1q52PKYFSGHO/cazGe0PcaNFqdQ0wmxnwk27z3tISSazIOyO4XxbxEikbtgLk7TttjOP31JZ93bsh8yZrvSOnjSkuFrUoMDpF3n7JDmBkRfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772287252; c=relaxed/simple;
	bh=ToJRIhJYU3hwQASkhF1l9qrKD+aj4fX5ukqk3oyVJrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rcsDFA1I8yGGjU3HvCDFZoyvbj/fr4aLK04NL3c7vD/I+V20Lg6LUr6c0mzMwlpSZVHJl2yCjJ7UtDPcCy3L/5i7hGmzOeXaMgU0tYM2d02GvHu3q2TaSz9NlTSlIeovfn9PoZqp4/RJRf4O87KJpojWtryn1aDVNp9sX7tFZcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWvQHzky; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWvQHzky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772287250; x=1803823250;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ToJRIhJYU3hwQASkhF1l9qrKD+aj4fX5ukqk3oyVJrw=;
  b=MWvQHzkyzn+V+44VWDqDauG//mzc7c2joH1roUhW5TQhJq93TQHT9Aas
   OiA7CsFDyRMAkQZFVof8tIqnvFItdbfnsGsfh9lYS/1QWJI2QdhaGxAOi
   54OEVuJDaivAM7KEmE5QdXJGaF7rJapUmLlgkAAvJ568FGuz1iLR7lt1a
   YHk/XMHdCUnhlKZhCRbr/9CyfybQY03/z6pwN/uOYC7PiQ3F1foZl2l1y
   ShntQ9k2u7nO7INTWoo/TJu0xgVutfrGU/9lQxg+3D/KROyvBJRnWMYOO
   +46CUSp/tXNPq9eALaVs34kEp1HEo0o3Z2qpa8J+O8KI+2WJ1zcRUqKkV
   Q==;
X-CSE-ConnectionGUID: qWg65Pm2RIy7sEdRcX5EPQ==
X-CSE-MsgGUID: EMiXjfiVQNKiMKMpkaac4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73463602"
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="73463602"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 06:00:49 -0800
X-CSE-ConnectionGUID: uj4qd2FgRKCPGYvUCzw1aw==
X-CSE-MsgGUID: BFfusbA5TdiD7KGfnwn00w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="217070766"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Feb 2026 06:00:47 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwKs2-00000000BbR-2CtT;
	Sat, 28 Feb 2026 14:00:41 +0000
Date: Sat, 28 Feb 2026 21:59:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/cros_kbd_led-cleanup 3/7]
 drivers/platform/chrome/cros_kbd_led_backlight.c:79:18: error: implicit
 declaration of function 'acpi_evaluate_integer'; did you mean
 'acpi_evaluate_object'?
Message-ID: <202602282111.wyPubj3T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/cros_kbd_led-cleanup
head:   daa221254bed55b8bb0814220c77831014f03446
commit: 44103d0e19b283f9e8d64215aee10ec01270e935 [3/7] CONFIG_ACPI
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260228=
/202602282111.wyPubj3T-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260228/202602282111.wyPubj3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602282111.wyPubj3T-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

   drivers/platform/chrome/cros_kbd_led_backlight.c: In function 'keyboard_=
led_get_brightness_acpi':
>> drivers/platform/chrome/cros_kbd_led_backlight.c:79:18: error: implicit =
declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluat=
e_object'? [-Wimplicit-function-declaration]
      79 |         status =3D acpi_evaluate_integer(NULL, ACPI_KEYBOARD_BAC=
KLIGHT_READ,
         |                  ^~~~~~~~~~~~~~~~~~~~~
         |                  acpi_evaluate_object
   drivers/platform/chrome/cros_kbd_led_backlight.c: At top level:
>> drivers/platform/chrome/cros_kbd_led_backlight.c:218:36: warning: 'keybo=
ard_led_acpi_match' defined but not used [-Wunused-const-variable=3D]
     218 | static const struct acpi_device_id keyboard_led_acpi_match[] =3D {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +79 drivers/platform/chrome/cros_kbd_led_backlight.c

492ef7829d2d09 Simon Que           2016-03-08   72 =20
492ef7829d2d09 Simon Que           2016-03-08   73  static enum led_brightn=
ess
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23   74  keyboard_led_get_bright=
ness_acpi(struct led_classdev *cdev)
492ef7829d2d09 Simon Que           2016-03-08   75  {
492ef7829d2d09 Simon Que           2016-03-08   76  	unsigned long long bri=
ghtness;
492ef7829d2d09 Simon Que           2016-03-08   77  	acpi_status status;
492ef7829d2d09 Simon Que           2016-03-08   78 =20
492ef7829d2d09 Simon Que           2016-03-08  @79  	status =3D acpi_evalua=
te_integer(NULL, ACPI_KEYBOARD_BACKLIGHT_READ,
492ef7829d2d09 Simon Que           2016-03-08   80  				       NULL, &brigh=
tness);
492ef7829d2d09 Simon Que           2016-03-08   81  	if (ACPI_FAILURE(statu=
s)) {
492ef7829d2d09 Simon Que           2016-03-08   82  		dev_err(cdev->dev, "E=
rror getting keyboard LED value: %d\n",
492ef7829d2d09 Simon Que           2016-03-08   83  			status);
492ef7829d2d09 Simon Que           2016-03-08   84  		return -EIO;
492ef7829d2d09 Simon Que           2016-03-08   85  	}
492ef7829d2d09 Simon Que           2016-03-08   86 =20
492ef7829d2d09 Simon Que           2016-03-08   87  	return brightness;
492ef7829d2d09 Simon Que           2016-03-08   88  }
492ef7829d2d09 Simon Que           2016-03-08   89 =20
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23   90  static int keyboard_led=
_init_acpi(struct platform_device *pdev)
492ef7829d2d09 Simon Que           2016-03-08   91  {
492ef7829d2d09 Simon Que           2016-03-08   92  	acpi_handle handle;
492ef7829d2d09 Simon Que           2016-03-08   93  	acpi_status status;
492ef7829d2d09 Simon Que           2016-03-08   94 =20
492ef7829d2d09 Simon Que           2016-03-08   95  	/* Look for the keyboa=
rd LED ACPI Device */
492ef7829d2d09 Simon Que           2016-03-08   96  	status =3D acpi_get_ha=
ndle(ACPI_ROOT_OBJECT,
492ef7829d2d09 Simon Que           2016-03-08   97  				 ACPI_KEYBOARD_BACK=
LIGHT_DEVICE,
492ef7829d2d09 Simon Que           2016-03-08   98  				 &handle);
492ef7829d2d09 Simon Que           2016-03-08   99  	if (ACPI_FAILURE(statu=
s)) {
492ef7829d2d09 Simon Que           2016-03-08  100  		dev_err(&pdev->dev, "=
Unable to find ACPI device %s: %d\n",
492ef7829d2d09 Simon Que           2016-03-08  101  			ACPI_KEYBOARD_BACKLI=
GHT_DEVICE, status);
492ef7829d2d09 Simon Que           2016-03-08  102  		return -ENXIO;
492ef7829d2d09 Simon Que           2016-03-08  103  	}
492ef7829d2d09 Simon Que           2016-03-08  104 =20
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  105  	return 0;
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  106  }
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  107 =20
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  108  static const struct key=
board_led_drvdata keyboard_led_drvdata_acpi =3D {
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  109  	.init =3D keyboard_led=
_init_acpi,
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  110  	.brightness_set =3D ke=
yboard_led_set_brightness_acpi,
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  111  	.brightness_get =3D ke=
yboard_led_get_brightness_acpi,
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  112  };
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  113 =20
3a1d61dc32022a Tzung-Bi Shih       2024-12-06  114  #if IS_ENABLED(CONFIG_M=
FD_CROS_EC_DEV)
3a1d61dc32022a Tzung-Bi Shih       2024-12-06  115  static int keyboard_led=
_init_ec_pwm_mfd(struct platform_device *pdev)
3a1d61dc32022a Tzung-Bi Shih       2024-12-06  116  {
3a1d61dc32022a Tzung-Bi Shih       2024-12-06  117  	struct cros_ec_dev *ec=
_dev =3D dev_get_drvdata(pdev->dev.parent);
3a1d61dc32022a Tzung-Bi Shih       2024-12-06  118  	struct cros_ec_device =
*cros_ec =3D ec_dev->ec_dev;
3a1d61dc32022a Tzung-Bi Shih       2024-12-06  119  	struct keyboard_led *k=
eyboard_led =3D platform_get_drvdata(pdev);
3a1d61dc32022a Tzung-Bi Shih       2024-12-06  120 =20
3a1d61dc32022a Tzung-Bi Shih       2024-12-06  121  	keyboard_led->ec =3D c=
ros_ec;
3a1d61dc32022a Tzung-Bi Shih       2024-12-06  122 =20
3a1d61dc32022a Tzung-Bi Shih       2024-12-06  123  	return 0;
3a1d61dc32022a Tzung-Bi Shih       2024-12-06  124  }
40f58143745eaa Tzung-Bi Shih       2022-05-23  125 =20
40f58143745eaa Tzung-Bi Shih       2022-05-23  126  static int
40f58143745eaa Tzung-Bi Shih       2022-05-23  127  keyboard_led_set_bright=
ness_ec_pwm(struct led_classdev *cdev,
40f58143745eaa Tzung-Bi Shih       2022-05-23  128  				   enum led_brightn=
ess brightness)
40f58143745eaa Tzung-Bi Shih       2022-05-23  129  {
04251bc86653a8 Gustavo A. R. Silva 2025-03-28  130  	DEFINE_RAW_FLEX(struct=
 cros_ec_command, msg, data,
04251bc86653a8 Gustavo A. R. Silva 2025-03-28  131  			sizeof(struct ec_par=
ams_pwm_set_keyboard_backlight));
04251bc86653a8 Gustavo A. R. Silva 2025-03-28  132  	struct ec_params_pwm_s=
et_keyboard_backlight *params =3D
04251bc86653a8 Gustavo A. R. Silva 2025-03-28  133  			(struct ec_params_pw=
m_set_keyboard_backlight *)msg->data;
40f58143745eaa Tzung-Bi Shih       2022-05-23  134  	struct keyboard_led *k=
eyboard_led =3D container_of(cdev, struct keyboard_led, cdev);
40f58143745eaa Tzung-Bi Shih       2022-05-23  135 =20
40f58143745eaa Tzung-Bi Shih       2022-05-23  136  	msg->command =3D EC_CM=
D_PWM_SET_KEYBOARD_BACKLIGHT;
40f58143745eaa Tzung-Bi Shih       2022-05-23  137  	msg->outsize =3D sizeo=
f(*params);
40f58143745eaa Tzung-Bi Shih       2022-05-23  138 =20
40f58143745eaa Tzung-Bi Shih       2022-05-23  139  	params->percent =3D br=
ightness;
40f58143745eaa Tzung-Bi Shih       2022-05-23  140 =20
40f58143745eaa Tzung-Bi Shih       2022-05-23  141  	return cros_ec_cmd_xfe=
r_status(keyboard_led->ec, msg);
40f58143745eaa Tzung-Bi Shih       2022-05-23  142  }
40f58143745eaa Tzung-Bi Shih       2022-05-23  143 =20
40f58143745eaa Tzung-Bi Shih       2022-05-23  144  static enum led_brightn=
ess
40f58143745eaa Tzung-Bi Shih       2022-05-23  145  keyboard_led_get_bright=
ness_ec_pwm(struct led_classdev *cdev)
40f58143745eaa Tzung-Bi Shih       2022-05-23  146  {
04251bc86653a8 Gustavo A. R. Silva 2025-03-28  147  	DEFINE_RAW_FLEX(struct=
 cros_ec_command, msg, data,
04251bc86653a8 Gustavo A. R. Silva 2025-03-28  148  			sizeof(struct ec_res=
ponse_pwm_get_keyboard_backlight));
04251bc86653a8 Gustavo A. R. Silva 2025-03-28  149  	struct ec_response_pwm=
_get_keyboard_backlight *resp =3D
04251bc86653a8 Gustavo A. R. Silva 2025-03-28  150  			(struct ec_response_=
pwm_get_keyboard_backlight *)msg->data;
40f58143745eaa Tzung-Bi Shih       2022-05-23  151  	struct keyboard_led *k=
eyboard_led =3D container_of(cdev, struct keyboard_led, cdev);
40f58143745eaa Tzung-Bi Shih       2022-05-23  152  	int ret;
40f58143745eaa Tzung-Bi Shih       2022-05-23  153 =20
40f58143745eaa Tzung-Bi Shih       2022-05-23  154  	msg->command =3D EC_CM=
D_PWM_GET_KEYBOARD_BACKLIGHT;
40f58143745eaa Tzung-Bi Shih       2022-05-23  155  	msg->insize =3D sizeof=
(*resp);
40f58143745eaa Tzung-Bi Shih       2022-05-23  156 =20
40f58143745eaa Tzung-Bi Shih       2022-05-23  157  	ret =3D cros_ec_cmd_xf=
er_status(keyboard_led->ec, msg);
40f58143745eaa Tzung-Bi Shih       2022-05-23  158  	if (ret < 0)
40f58143745eaa Tzung-Bi Shih       2022-05-23  159  		return ret;
40f58143745eaa Tzung-Bi Shih       2022-05-23  160 =20
40f58143745eaa Tzung-Bi Shih       2022-05-23  161  	return resp->percent;
40f58143745eaa Tzung-Bi Shih       2022-05-23  162  }
40f58143745eaa Tzung-Bi Shih       2022-05-23  163 =20
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  164  static const struc=
t keyboard_led_drvdata keyboard_led_drvdata_ec_pwm_mfd =3D {
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  165  	.init =3D keyboar=
d_led_init_ec_pwm_mfd,
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  166  	.brightness_set_b=
locking =3D keyboard_led_set_brightness_ec_pwm,
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  167  	.brightness_get =
=3D keyboard_led_get_brightness_ec_pwm,
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  168  };
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  169 =20
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  170  #else /* IS_ENABLE=
D(CONFIG_MFD_CROS_EC_DEV) */
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  171 =20
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  172  static const struc=
t keyboard_led_drvdata keyboard_led_drvdata_ec_pwm_mfd =3D {};
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  173 =20
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  174  #endif /* IS_ENABL=
ED(CONFIG_MFD_CROS_EC_DEV) */
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  175 =20
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  176  static int keyboar=
d_led_is_mfd_device(struct platform_device *pdev)
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  177  {
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  178  	return IS_ENABLED=
(CONFIG_MFD_CROS_EC_DEV) && mfd_get_cell(pdev);
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  179  }
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  180 =20
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  181  static int keyboard_led=
_probe(struct platform_device *pdev)
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  182  {
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  183  	const struct keyboard_=
led_drvdata *drvdata;
40f58143745eaa Tzung-Bi Shih       2022-05-23  184  	struct keyboard_led *k=
eyboard_led;
cfa842c80c9996 Tzung-Bi Shih       2024-11-20  185  	int err;
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  186 =20
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  187  	if (keyboard_led_=
is_mfd_device(pdev))
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  188  		drvdata =3D &key=
board_led_drvdata_ec_pwm_mfd;
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  189  	else
fd1e8054ff6985 Tzung-Bi Shih       2022-05-23  190  		drvdata =3D device_ge=
t_match_data(&pdev->dev);
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  191  	if (!drvdata)
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  192  		return -EINVAL;
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  193 =20
40f58143745eaa Tzung-Bi Shih       2022-05-23  194  	keyboard_led =3D devm_=
kzalloc(&pdev->dev, sizeof(*keyboard_led), GFP_KERNEL);
40f58143745eaa Tzung-Bi Shih       2022-05-23  195  	if (!keyboard_led)
40f58143745eaa Tzung-Bi Shih       2022-05-23  196  		return -ENOMEM;
40f58143745eaa Tzung-Bi Shih       2022-05-23  197  	platform_set_drvdata(p=
dev, keyboard_led);
40f58143745eaa Tzung-Bi Shih       2022-05-23  198 =20
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  199  	if (drvdata->init) {
cfa842c80c9996 Tzung-Bi Shih       2024-11-20  200  		err =3D drvdata->init=
(pdev);
cfa842c80c9996 Tzung-Bi Shih       2024-11-20  201  		if (err)
cfa842c80c9996 Tzung-Bi Shih       2024-11-20  202  			return err;
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  203  	}
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  204 =20
40f58143745eaa Tzung-Bi Shih       2022-05-23  205  	keyboard_led->cdev.nam=
e =3D "chromeos::kbd_backlight";
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  206  	keyboard_led->cde=
v.flags |=3D LED_CORE_SUSPENDRESUME | LED_REJECT_NAME_CONFLICT;
3323c3bc2242a6 Thomas Wei=C3=9Fschuh    2026-02-28  207  	keyboard_led->cde=
v.max_brightness =3D 100;
40f58143745eaa Tzung-Bi Shih       2022-05-23  208  	keyboard_led->cdev.bri=
ghtness_set =3D drvdata->brightness_set;
40f58143745eaa Tzung-Bi Shih       2022-05-23  209  	keyboard_led->cdev.bri=
ghtness_set_blocking =3D drvdata->brightness_set_blocking;
40f58143745eaa Tzung-Bi Shih       2022-05-23  210  	keyboard_led->cdev.bri=
ghtness_get =3D drvdata->brightness_get;
492ef7829d2d09 Simon Que           2016-03-08  211 =20
cfa842c80c9996 Tzung-Bi Shih       2024-11-20  212  	err =3D devm_led_class=
dev_register(&pdev->dev, &keyboard_led->cdev);
cfa842c80c9996 Tzung-Bi Shih       2024-11-20  213  	if (err =3D=3D -EEXIST=
) /* Already bound via other mechanism */
baa19b650794d5 Thomas Wei=C3=9Fschuh    2024-05-26  214  		return -ENODEV;
cfa842c80c9996 Tzung-Bi Shih       2024-11-20  215  	return err;
492ef7829d2d09 Simon Que           2016-03-08  216  }
492ef7829d2d09 Simon Que           2016-03-08  217 =20
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23 @218  static const struct acp=
i_device_id keyboard_led_acpi_match[] =3D {
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  219  	{ "GOOG0002", (kernel_=
ulong_t)&keyboard_led_drvdata_acpi },
492ef7829d2d09 Simon Que           2016-03-08  220  	{ }
492ef7829d2d09 Simon Que           2016-03-08  221  };
44103d0e19b283 Thomas Wei=C3=9Fschuh    2026-02-28  222  #ifdef CONFIG_ACPI
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  223  MODULE_DEVICE_TABLE(acp=
i, keyboard_led_acpi_match);
6b1e5ba39c4444 Tzung-Bi Shih       2022-05-23  224  #endif
492ef7829d2d09 Simon Que           2016-03-08  225 =20

:::::: The code at line 79 was first introduced by commit
:::::: 492ef7829d2d09428803bffb187d5781bbc12ca5 platform/chrome: Add Chrome=
 OS keyboard backlight LEDs support

:::::: TO: Simon Que <sque@chromium.org>
:::::: CC: Olof Johansson <olof@lixom.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
