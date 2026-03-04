Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A402D1C5486
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 00:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772585049; cv=none; b=AamCTAHCP83nNtHy9Smk8YtRU7usyhHFCO4yHJN5GkKNw/TAjaVUOOazuTEfU27MO9qjUJSG8Zj9sZUWtTJfPSvvjztD3Xj2cMXsuj+VQTg7qo9zD1C6zWG5gpqykPSytBCg5Sh/NtVkrRTOnTFfY80eP7km5eWhOoTqWxOwyTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772585049; c=relaxed/simple;
	bh=Zkob2nMZu1lLk2D2D7I8BaOMhoIfrOCRhnnAd+SfTsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UVeE60XD9DlXKscJy3PffpNAMqsRNK0kGvAca17wJBoDMQQGpgCngHAMkvzZMWBLcUph+TQ9VnhCZShgiX1O5CDRothUWr9ZEw9M4Xc7YCb0D9fjXLhV4dJFNSbQ1d3JWwXSoYPFwATHt867UpC91vihqnKbZG+8vwoKytsQfY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVKJ1zvh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVKJ1zvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772585047; x=1804121047;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Zkob2nMZu1lLk2D2D7I8BaOMhoIfrOCRhnnAd+SfTsk=;
  b=XVKJ1zvhCVEZeDw+fNUyZU40yIpsHfDItnFhQ6frMvjMocnZjLEzgHtm
   EY5pJic9mo6DnjLTZ7MIXNh3bA8jd7pgY9DhRdL+JYsf7puXGLwudNfyZ
   owb+vVubgdTf5cnDb6usAFTy5wEZZpCIk/j+sth8vMw+cHY3nb2LJOWOZ
   UaP1aozP/p2bFIuRuAWsrCdtfiXFSJJ6jysynkoecpBH8gIGQzGFTjLNt
   J9Wwyqd4Kd5VD4dpAKLbVTCS5p1AJVoglCjjYWRqg1BXUCg6Fik/FVpxN
   FyzmTfATjBeWSYa3+ZRQMWXnQVSFIPUPt4PszxKqVtGwHi5OfnNtmPhKf
   g==;
X-CSE-ConnectionGUID: D9L7kDyQRU+VvtVtYqelSg==
X-CSE-MsgGUID: aVimtvYpTvigvp/FWnsRRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="83976606"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="83976606"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 16:44:02 -0800
X-CSE-ConnectionGUID: rAHKE1tgTrm9JWvF3nMfHg==
X-CSE-MsgGUID: mW9IxpJURqCGWsXePhBuCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="216504916"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Mar 2026 16:44:01 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxaLG-0000000033V-12Bb;
	Wed, 04 Mar 2026 00:43:58 +0000
Date: Wed, 04 Mar 2026 08:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 28/28]
 drivers/platform/x86/inspur_platform_profile.c:188:1: warning: control
 reaches end of non-void function
Message-ID: <202603040843.7xWGk17M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Kurt,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-deskt=
op
head:   8e5209e3b2974d51db2fd44a262f0d2bc2b7798d
commit: 15ff3def5e7516c9599f03e3139358e29dd00664 [28/28] BACKPORT: UPSTREAM=
: ACPI: platform_profile: Let drivers set drvdata to the class device
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260304=
/202603040843.7xWGk17M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260304/202603040843.7xWGk17M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603040843.7xWGk17M-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/inspur_platform_profile.c: In function 'inspur_wmi_=
probe':
   drivers/platform/x86/inspur_platform_profile.c:187:16: error: too few ar=
guments to function 'platform_profile_register'
     187 |         return platform_profile_register(&priv->handler);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/inspur_platform_profile.c:11:
   include/linux/platform_profile.h:43:5: note: declared here
      43 | int platform_profile_register(struct platform_profile_handler *p=
prof, void *drvdata);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/inspur_platform_profile.c: In function 'inspur_wmi_=
remove':
   drivers/platform/x86/inspur_platform_profile.c:192:9: error: too few arg=
uments to function 'platform_profile_remove'
     192 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:44:5: note: declared here
      44 | int platform_profile_remove(struct platform_profile_handler *ppr=
of);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/inspur_platform_profile.c: In function 'inspur_wmi_=
probe':
>> drivers/platform/x86/inspur_platform_profile.c:188:1: warning: control r=
eaches end of non-void function [-Wreturn-type]
     188 | }
         | ^


vim +188 drivers/platform/x86/inspur_platform_profile.c

94ace9eda88229c Ai Chao 2023-10-20  168 =20
94ace9eda88229c Ai Chao 2023-10-20  169  static int inspur_wmi_probe(struct=
 wmi_device *wdev, const void *context)
94ace9eda88229c Ai Chao 2023-10-20  170  {
94ace9eda88229c Ai Chao 2023-10-20  171  	struct inspur_wmi_priv *priv;
94ace9eda88229c Ai Chao 2023-10-20  172 =20
94ace9eda88229c Ai Chao 2023-10-20  173  	priv =3D devm_kzalloc(&wdev->dev,=
 sizeof(*priv), GFP_KERNEL);
94ace9eda88229c Ai Chao 2023-10-20  174  	if (!priv)
94ace9eda88229c Ai Chao 2023-10-20  175  		return -ENOMEM;
94ace9eda88229c Ai Chao 2023-10-20  176 =20
94ace9eda88229c Ai Chao 2023-10-20  177  	priv->wdev =3D wdev;
94ace9eda88229c Ai Chao 2023-10-20  178  	dev_set_drvdata(&wdev->dev, priv);
94ace9eda88229c Ai Chao 2023-10-20  179 =20
94ace9eda88229c Ai Chao 2023-10-20  180  	priv->handler.profile_get =3D ins=
pur_platform_profile_get;
94ace9eda88229c Ai Chao 2023-10-20  181  	priv->handler.profile_set =3D ins=
pur_platform_profile_set;
94ace9eda88229c Ai Chao 2023-10-20  182 =20
94ace9eda88229c Ai Chao 2023-10-20  183  	set_bit(PLATFORM_PROFILE_LOW_POWE=
R, priv->handler.choices);
94ace9eda88229c Ai Chao 2023-10-20  184  	set_bit(PLATFORM_PROFILE_BALANCED=
, priv->handler.choices);
94ace9eda88229c Ai Chao 2023-10-20  185  	set_bit(PLATFORM_PROFILE_PERFORMA=
NCE, priv->handler.choices);
94ace9eda88229c Ai Chao 2023-10-20  186 =20
94ace9eda88229c Ai Chao 2023-10-20  187  	return platform_profile_register(=
&priv->handler);
94ace9eda88229c Ai Chao 2023-10-20 @188  }
94ace9eda88229c Ai Chao 2023-10-20  189 =20

:::::: The code at line 188 was first introduced by commit
:::::: 94ace9eda88229c73698b8dd8d3c06dd0831319c platform/x86: inspur-platfo=
rm-profile: Add platform profile support

:::::: TO: Ai Chao <aichao@kylinos.cn>
:::::: CC: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
