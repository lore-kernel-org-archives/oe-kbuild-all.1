Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413A500972
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 23:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768865666; cv=none; b=BBNK6uTSh7mrXYA86LJqSJK1ohUdCRvCztV9OOMYHMe3x3itartSdVBR/kZY844rCdP6rTHoh6BZwnZ5U8CVKKgi6hgaDhpvXFV9oRrW7WOdm/3jWRMMeCl6kV0vpTeygTf7H6DU65A9r7xy5TKjy+/jAFU6cqI8BjruLJdXqj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768865666; c=relaxed/simple;
	bh=PN+d2n8Hbf6EMPcmnTPN9LJBa8b2ldnAH+G415IPCFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E074XRnv3d0C++dYq3OyjIQcQL3sWr+ZlpvJDH1v+39MMzdCK012Kl2m04YpTyX64TtG2hIBciJdJ+gnzTX9X86wMUZFv8SGrlF5cnz1ga0rNEo1vOw0boJBNib1hm0JklRnwy4tS/eyiY6BWd9QPwyE7vnvkBQJXHg0FkMevYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7CyYXt6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7CyYXt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768865664; x=1800401664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PN+d2n8Hbf6EMPcmnTPN9LJBa8b2ldnAH+G415IPCFM=;
  b=F7CyYXt6LPU899FZQMC4Mggw1aSbiUI3UBe/8sr6iDSmCm+2u7wKZgBw
   pL8wsL4g9Bd48fBJyju34K+juMvidxEdIco6EVNNNIEVueH4/eQZ16ZZ6
   9d/c9VNNHFPAw4doJDOSnYakTmMfIukOgSFVy6Tu3v93Jjn5CYMSFJ/0u
   ZUXM9poWFJoQquEaa7nu80Aq91wC+5gggRPAoKBKfaWaJZ+PlgsGEuZJj
   fJ46M7mteCSimlJJDS5CN0WOrD6z4YS5pgot10Vuse7q2Dh2prW6yocMJ
   xJ4ngkiiHCYozmjLYxf1UEc2DpLNUFlzEnLcljcmCpKj7Vv6b/LdKzkJO
   Q==;
X-CSE-ConnectionGUID: PvHlf1+vTeyA+ZwNRCyGDQ==
X-CSE-MsgGUID: cAiQOCnfTJmaEdIC+/AguQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81445687"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="81445687"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 15:34:23 -0800
X-CSE-ConnectionGUID: 0nwSvOOOScae2PBZ4/FCZw==
X-CSE-MsgGUID: GJwt9McJR7eciqJA4rq51Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="205596419"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jan 2026 15:34:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhylI-00000000OOD-3Tl8;
	Mon, 19 Jan 2026 23:34:20 +0000
Date: Tue, 20 Jan 2026 07:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/6] x86/cpu: Add missing #include
Message-ID: <202601200720.f3Wg8ffm-lkp@intel.com>
References: <20260119195051.4235E147@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119195051.4235E147@davehans-spike.ostc.intel.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on linus/master v6.19-rc6 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Hansen/x86-cpu-Break-Vendor-Family-Model-macros-into-separate-header/20260120-035537
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260119195051.4235E147%40davehans-spike.ostc.intel.com
patch subject: [PATCH 2/6] x86/cpu: Add missing #include
config: parisc-randconfig-001-20260120 (https://download.01.org/0day-ci/archive/20260120/202601200720.f3Wg8ffm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200720.f3Wg8ffm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200720.f3Wg8ffm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/peci-cpu.h:33,
                    from drivers/peci/device.c:6:
>> include/linux/../../arch/x86/include/asm/intel-family.h:5:10: fatal error: asm/vfm.h: No such file or directory
    #include <asm/vfm.h>
             ^~~~~~~~~~~
   compilation terminated.


vim +5 include/linux/../../arch/x86/include/asm/intel-family.h

     4	
   > 5	#include <asm/vfm.h>
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
