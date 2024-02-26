Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FDA77F19
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708941052; cv=none; b=FZvwn0Z+xA6BGm0VuQ4mD+XYj3GHxGlgbaVHuxkY4eyxWdMohtqDE25TXpujuopkdFkuKmlATYI9NcaegIMgas2meIJnYJLS1yyfQlhsunEf0Tip95xRmO5dILmF0cZNcA+9lpN34rjLpBJMR+01r9rwd8QJc9+Vje2I8kxljEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708941052; c=relaxed/simple;
	bh=ah/qAqXWUUqo8ySi2Msv+8PJ3vqKtMFNzibogvVcAkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MZHLFThCgEcWqXc08se9g+e/aKXJ+z9lrYGcSL07FeEhdMhvsTK+4rozuqPvwnYAeKIs1flxr6Vx/kabUfkJEAABOdrqS4ckGU+9/SUY2G8amqlGKZZuvn3bWaoRUxcxx7Cdi7mxinXE7dcROV4qPwvK1Shxq8aPjLF2N8nGDFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrWiZphM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrWiZphM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708941051; x=1740477051;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ah/qAqXWUUqo8ySi2Msv+8PJ3vqKtMFNzibogvVcAkU=;
  b=BrWiZphM9rtBawZveVkOMDUDB9fhRyiOnTDZsc3UjvaSYUlgXBX7AEkg
   ZnxtDpt1YCLK5iClK+BI6bd1fAqj+URqv5ce8IhS+IjCBEpQICftgimWj
   zOi6aMe+lo6xue9i54Qollx8aw9b2rnd/2ogQisbX+aIwz/dOwD5ks4LU
   6QC793boLG53ZsFV9GxnOT1SNKudMFsUirC4EzhPfbZmoIBNVMuBpdH5S
   ULwMEWFfVdKhaAtEgBy+Ho0ZHAYGjclBaMDChH02bAf8n80Mv5mrGIEFV
   BVENOPzxSpV0kZoBJnyjbjsKQeIcRnFGZEffm8Ld1fNlI3o35goZK+G5g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3076990"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3076990"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 01:50:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6757696"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2024 01:50:49 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reXdG-000AEN-32;
	Mon, 26 Feb 2024 09:50:46 +0000
Date: Mon, 26 Feb 2024 17:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.15] media: atomisp: sh_css: check
 ia_css_pipeline_create_and_add_stage() return code
Message-ID: <Zdxe0-EePPPIicm8@fdb2c0c3c270>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226090323.21799-1-adiupina@astralinux.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 5.15] media: atomisp: sh_css: check ia_css_pipeline_create_and_add_stage() return code
Link: https://lore.kernel.org/stable/20240226090323.21799-1-adiupina%40astralinux.ru

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



