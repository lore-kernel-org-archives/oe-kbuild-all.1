Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010343A784E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778578508; cv=none; b=Z17biU+nXLH+RkjryDOw5G8FgcPZwEuyF2q4gCq73tHiiP5Fi/WDJNreSh/mFNBX6sc4R8IV8uTAms3cPuYHq2L3m9BL9t03qYASglVN8zMbjZg01iOEXouYc3Z5xPbiga+LD2GDPYLNfKeGT7zN+TvbqLinTz5wXwvk5fBuvEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778578508; c=relaxed/simple;
	bh=SoBIhEZuX8j1Ij0Hs/U2RF61VdPgq5hWmeyRhDCZnR8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M2ybHG8dqIn1/l0kbS+kXszoxmuFm8WkxH2dQ5wbCiuPOtm04kpPkPQcXytUoL3OYdPCHz32KDtD93/8+TKBA5EoxxHVDoV3l4C6oNKDgVADEPs769Uoly1Mqew2nhjrqDcYXMmnViZfj0POCBcLnhhrS4QE1BpMPeYtevskg2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hR5moxpG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hR5moxpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778578505; x=1810114505;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SoBIhEZuX8j1Ij0Hs/U2RF61VdPgq5hWmeyRhDCZnR8=;
  b=hR5moxpGiPR8fgZyV9ZoGgfSsFtYyOoG0uaWgrKvoBNhujboKz9j+sKb
   2O3dYBaKCxwBdYpZ7dsf1ghqeiqV3j6qnXeUtvVf0D9AxYg6bB/TcbaLW
   F2n+T8TOP6UOAUNLU3DU0KedQ/yEt7Opr0uTd6gubZkI6bDycLGxjq5S8
   oAx31PWQ80lYg8lwtOMJRpX2ZNVbikJN86wqLMGP3w3nZcL3bDTYYNr3o
   BqjccFKe2eC2kkDmLZPh7mErUi5al0qf7i8wjuKL5Ij+wwoQ399zqAARY
   N7a7aQfLkV1G81505GZPKANo/DBpQ7WkTMrEU05WDHk81PlAH4+9genSt
   Q==;
X-CSE-ConnectionGUID: iLQDfejcSDeQmCQGX9eFZA==
X-CSE-MsgGUID: H22tc62QSMiPG6bNlMemyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79593019"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79593019"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 02:35:03 -0700
X-CSE-ConnectionGUID: L5lhddmvR3KySAesDfoYRA==
X-CSE-MsgGUID: HD3jpNEZT1WRX0s4cpLYXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="235052131"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.190])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 02:34:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 12 May 2026 12:34:56 +0300 (EEST)
To: kernel test robot <lkp@intel.com>, 
    Anvesh Jain P <anvesh.p@oss.qualcomm.com>
cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, oe-kbuild-all@lists.linux.dev, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Maya Matuszczyk <maccraft123mc@gmail.com>, 
    Dmitry Baryshkov <lumag@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 21/30] htmldocs:
 Warning: MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
In-Reply-To: <202605112207.TL7dR71j-lkp@intel.com>
Message-ID: <317a522a-1014-16af-2f2a-43305d5182fc@linux.intel.com>
References: <202605112207.TL7dR71j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 May 2026, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
> head:   165e81354eefd5551358112773f24027aac59d5a
> commit: 5c44f48e91deefdd42e567a2779d331937c97cd0 [21/30] platform: arm64: Add driver for EC found on Qualcomm reference devices
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260511/202605112207.TL7dR71j-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605112207.TL7dR71j-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
>    Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
>    Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>    Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
>    Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
> >> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml

This is an artifact of platform tree only taking the platform drivers 
patch.

The rest of the patches (bindings + dts changes) should go in together 
through other tree more appropriate for them.

Once everything is put together in linux-next / Linus' tree, the warning 
should no longer appear.

Thus, it looks there's no need to act on this warning.

-- 
 i.

