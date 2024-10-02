Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A23198E6F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859859; cv=none; b=q/CouA/H5tpA3JMKwKIgGCgeyAYsWGqQ0rq1nAdxMKBqwHv3FMyOL3YELZirVPOiZtRgea4YL6XPTtJXWY6Rjy7AVv8S51ldNyBom9iOB/vWH/YdR147hyISnYqt+pgvYMm3SgEilaVv3SqLMtbLD5KKDLsNPTGtdx6O4TY1Qes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859859; c=relaxed/simple;
	bh=11X1UrKxV4/qMKf6LpnoEVhkN87cfgasdMiBxKiT5nI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FVmyfUtwvdJ0E8rsj2g4fffBCHsLCDa3xMPbhpek4MI3TuLnBeZlGWGS4c4FYgB8z0UFL0NipNbczvxovoYnrv4K6IPdyuh2rH1KkfRWH/6TTC3Hq6gq4TTnLyXsgyiej3K5vk0YGJDuW/JyctkFcBOG2egUAwXxV5vmXOSszEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIdpTQCq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIdpTQCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727859858; x=1759395858;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=11X1UrKxV4/qMKf6LpnoEVhkN87cfgasdMiBxKiT5nI=;
  b=JIdpTQCqbm82oIMG61SMpitm8mL9mnFKVU88btPbQe9d9bVhCJuteZ9W
   5+NEM8wXOkayrAg+JmQlWb2989K/EnLj2C0v8g2bUzkyqwse8R+NYl6CX
   L6oCAF+wUOdteyehMZpKcfMcOhdEu+maWJ5DilTlh7iXTLNY8qkV2qvLP
   xcZIYD8cBbpwopgOi8bp9Zao6d+qmT7AiECzDi7EoSuC7NI9W4jno6bxo
   IzUlxSmftb6iu9gOG8O+nqErpy4aGqVMvYaNRpbFjeW1KZO6Q7pzwsW+O
   xKY7SOvQlmjxqJ5e66jcPixyWsFGVSPEHxPNNIdRXvDN5eDOjPm6CftzS
   A==;
X-CSE-ConnectionGUID: dYvKKShKRceJCnWJa2ed2Q==
X-CSE-MsgGUID: M33wkw6XR1SVCGA4w+NAZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="38399871"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="38399871"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 02:04:17 -0700
X-CSE-ConnectionGUID: 0e6yo0/KQpS4e3p5VYlv7A==
X-CSE-MsgGUID: MErNHTWRS5mK3cXof9116w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74178660"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.31])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 02:04:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Oct 2024 12:04:11 +0300 (EEST)
To: kernel test robot <lkp@intel.com>
cc: Suma Hegde <suma.hegde@amd.com>, oe-kbuild-all@lists.linux.dev, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo 8/11]
 drivers/platform/x86/amd/hsmp/plat.c:58:37: warning: unused variable
 'hsmp_fops'
In-Reply-To: <202410021345.okdVjjGy-lkp@intel.com>
Message-ID: <966f5ae1-264a-8183-2a5e-5e79d4489e87@linux.intel.com>
References: <202410021345.okdVjjGy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Oct 2024, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
> head:   4360c22c8f071b5e930fdd8f1423ef6dab0f8471
> commit: 074a970fbc165bdac7fc39a31b483648e8969a79 [8/11] platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers
> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410021345.okdVjjGy-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021345.okdVjjGy-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410021345.okdVjjGy-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/platform/x86/amd/hsmp/plat.c:58:37: warning: unused variable 'hsmp_fops' [-Wunused-const-variable]
>       58 | static const struct file_operations hsmp_fops = {
>          |                                     ^~~~~~~~~
>    1 warning generated.
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for MODVERSIONS
>    Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
>    Selected by [y]:
>    - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
> 
> 
> vim +/hsmp_fops +58 drivers/platform/x86/amd/hsmp/plat.c
> 
>     57	
>   > 58	static const struct file_operations hsmp_fops = {
>     59		.owner		= THIS_MODULE,
>     60		.unlocked_ioctl	= hsmp_ioctl,
>     61		.compat_ioctl	= hsmp_ioctl,
>     62	};
>     63	

Hi Suma,

Can you please fix this.

I'll pull these patches from review-ilpo for now (I tentatively put them 
there to make sure this is build tested properly as these days I don't 
thrust all patches on the ML are tested by LKP).

-- 
 i.

