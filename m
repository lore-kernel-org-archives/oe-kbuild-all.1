Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7AF32D421
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 06:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762844041; cv=none; b=UBPkcIpeEitYVsnEB3ZK2pUY0/PsyaHU7Bku8+Nn2eHCvFqfN6lMFBVpeuZPT8SxfvDm3jyQV78aQ4neLHVORerUBX0yDnpmOZZhZnrHwBijWkpQwsQY11rZHuBQgRoGQAfZAmYLlGp8z3urwIJuSVQ31m5KIFrLkeui/+/3ZnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762844041; c=relaxed/simple;
	bh=xwKJ2OZInrOV9QwDsYLEOZJjAGoBztbUSeW9SN5oSnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fl9YYflrh1nprX1rldvInEZq+Q4gUrz6Bpjkj/ZQxooqUU0Yr9rQR4jQhU8kL4z92wamWNPGBHHY7UJzJaTGMvZIgok6QDE18wqqaxWXbkM/dypGJL2R6nd1WkYce4hyaOpQZWFe8UjzPeGa+N8dYeGp5nRkJ3LJqxoDXRPAH0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRU3Xk3e; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRU3Xk3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762844040; x=1794380040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xwKJ2OZInrOV9QwDsYLEOZJjAGoBztbUSeW9SN5oSnA=;
  b=dRU3Xk3eONBlAZjmZ5UHNnREZ78qHddN4Bga4S59DZ3LL+f1p0nfQk4V
   Oy7UGa+l3acl9ndXxrtYcppHNzExF4H2Ge0E3cIzAwnD621MwHRPij5eK
   FtiizKC96v747Dotjz9eVcePy37750JiqXcesX7kTNBIY9YiPYTm1G9PF
   BrRWRp3sanrmVAmL2/IzcMQ0rkqk7FsONUgQ2Xb7F0aBBi/jKU6jRVAdi
   gnFEKM5Eu/t6WIuFxfjV87KdoBKjytzXHn8qpHATrN1z4e63lu4m6W/9K
   pfhnJ6A/Y2i8QaToZdgm5EI+JsG5rI/S85ouUJnlT+pS9hjjLF3R2DLeB
   g==;
X-CSE-ConnectionGUID: DgFz1shLSci90wMDhReTAg==
X-CSE-MsgGUID: Uapy2G+xTdGLcD96/i327g==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="65058782"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="65058782"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 22:53:58 -0800
X-CSE-ConnectionGUID: FQ26DOY0TiuoXffS+mUq1Q==
X-CSE-MsgGUID: hmpvrjNtSV+aFOGvSQgffQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="194075959"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Nov 2025 22:53:56 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIiGH-0002sD-1e;
	Tue, 11 Nov 2025 06:53:53 +0000
Date: Tue, 11 Nov 2025 14:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Foster <foster.ryan.r@gmail.com>, selinux@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org, serge@hallyn.com, paul@paul-moore.com,
	Ryan Foster <foster.ryan.r@gmail.com>
Subject: Re: [PATCH] security: Add KUnit tests for rootid_owns_currentns()
Message-ID: <202511111459.1ToyUP5p-lkp@intel.com>
References: <20251110143748.4144288-1-foster.ryan.r@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110143748.4144288-1-foster.ryan.r@gmail.com>

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on pcmoore-selinux/next]
[also build test ERROR on linus/master v6.18-rc5 next-20251110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Foster/security-Add-KUnit-tests-for-rootid_owns_currentns/20251110-223824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git next
patch link:    https://lore.kernel.org/r/20251110143748.4144288-1-foster.ryan.r%40gmail.com
patch subject: [PATCH] security: Add KUnit tests for rootid_owns_currentns()
config: mips-randconfig-r053-20251111 (https://download.01.org/0day-ci/archive/20251111/202511111459.1ToyUP5p-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111459.1ToyUP5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111459.1ToyUP5p-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> security/commoncap_test.c:23:3: error: conflicting types for 'vfsuid_t'
    } vfsuid_t;
      ^~~~~~~~
   In file included from include/linux/fs.h:45,
                    from arch/mips/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from include/kunit/test.h:24,
                    from security/commoncap_test.c:9:
   include/linux/mnt_idmapping.h:17:3: note: previous declaration of 'vfsuid_t' was here
    } vfsuid_t;
      ^~~~~~~~
>> security/commoncap_test.c:26:21: error: conflicting types for '__vfsuid_val'
    static inline uid_t __vfsuid_val(vfsuid_t uid)
                        ^~~~~~~~~~~~
   In file included from include/linux/fs.h:45,
                    from arch/mips/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from include/kunit/test.h:24,
                    from security/commoncap_test.c:9:
   include/linux/mnt_idmapping.h:34:21: note: previous definition of '__vfsuid_val' was here
    static inline uid_t __vfsuid_val(vfsuid_t uid)
                        ^~~~~~~~~~~~
>> security/commoncap_test.c:31: warning: "VFSUIDT_INIT" redefined
    #define VFSUIDT_INIT(val) ((vfsuid_t){ __kuid_val(val) })
    
   In file included from include/linux/fs.h:45,
                    from arch/mips/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from include/kunit/test.h:24,
                    from security/commoncap_test.c:9:
   include/linux/mnt_idmapping.h:109: note: this is the location of the previous definition
    #define VFSUIDT_INIT(val) (vfsuid_t){ __kuid_val(val) }
    


vim +/vfsuid_t +23 security/commoncap_test.c

    18	
    19	/* Forward declare the minimal types we need - match the actual kernel definitions */
    20	struct mnt_idmap;
    21	typedef struct {
    22		uid_t val;
  > 23	} vfsuid_t;
    24	
    25	/* Minimal macros we need - match kernel definitions from mnt_idmapping.h */
  > 26	static inline uid_t __vfsuid_val(vfsuid_t uid)
    27	{
    28		return uid.val;
    29	}
    30	
  > 31	#define VFSUIDT_INIT(val) ((vfsuid_t){ __kuid_val(val) })
    32	#define INVALID_VFSUID VFSUIDT_INIT(INVALID_UID)
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
