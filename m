Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6534394464
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 20:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773348765; cv=none; b=EllMd2kRYkVsbjnouIBr9OENiIG8dq9D3lfMdoZn6RsjTYWCUXOMqc8TeSUsoLfgNsBcAVGyVsXDncGXHbrbcpAtyROfo1pdKDya7GvAIDP44gj96LuY7AxdqjIeCPvEwoMsqCDtrHxBw3Vubu66IzL6Gb7FpY0kI5CfEpaE7Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773348765; c=relaxed/simple;
	bh=ilSZ3bPpiWPzv2qDuOEddjmgSIspNYN0nZpFVXibE3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQUw3UKUSYq5fvpI0UAY6fNBiWm3Hqdlys8V/UBdL1mv4rE6YR5dDUecYSF0WDdsH1NV+8JSSn+zV0IYnLk3i5ExMJ0hnL2J7h7Wk9toAaOUPC/iaOh9sEvlv1u6hw2HRV7YmB1h0DAX2Cj/sJXgDXI2JrFQTjkbbHuLgf0O3dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESRegNoV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESRegNoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773348763; x=1804884763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ilSZ3bPpiWPzv2qDuOEddjmgSIspNYN0nZpFVXibE3o=;
  b=ESRegNoV62AKAJ8Rtvner2kLYpS740QlBx4fkQeDV/l7W2dr2zhW9J8r
   coc+TwALp4g5TSuDOar2onu2JAf+y/n3vzr294tKCPSGqNme8oFydzQjS
   qh1Uvl/eATohY0CqIwp3W4oCoPbrjroWkeRHNn3tsam6r/ZzbSjAkORtx
   F8IVAbZ+26FblvD0sAt5fQf08TAfCvRpYjAUpk+ai5uVppqmZopZ/BAsp
   SkhC3XlLYJFu9QC0W/oabzlLipIleqyDmbvxHxTlCMXdCfkxDa81E0P8n
   TWkbzOLCI3OtRT3HhIaZ9tvZ2q1vgzKjiTVKkyk0PTAIozmCL0sXBHpJe
   A==;
X-CSE-ConnectionGUID: l/oLXWnERdm8bLnStvX1qg==
X-CSE-MsgGUID: jYo99QgKS2GZCnzZEu/knQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74370784"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74370784"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 13:52:39 -0700
X-CSE-ConnectionGUID: U4hMrmyBR+6AzpOz4fNPIQ==
X-CSE-MsgGUID: YO0EO7IzS0KMOEEnLGgSug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="220887341"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2026 13:52:32 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0n19-000000003Bd-33f8;
	Thu, 12 Mar 2026 20:52:27 +0000
Date: Fri, 13 Mar 2026 04:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: Chengwen Feng <fengchengwen@huawei.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Kees Cook <kees@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v6 2/3] x86: Implement acpi_get_cpu_uid()
Message-ID: <202603130444.wmvLi9e8-lkp@intel.com>
References: <20260312072316.4806-3-fengchengwen@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312072316.4806-3-fengchengwen@huawei.com>

Hi Chengwen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on pci/next pci/for-linus rafael-pm/linux-next rafael-pm/bleeding-edge tip/x86/core linus/master v7.0-rc3 next-20260311]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/ACPI-Rename-get_acpi_id_for_cpu-to-acpi_get_cpu_uid-on-non-x86/20260312-152657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260312072316.4806-3-fengchengwen%40huawei.com
patch subject: [PATCH v6 2/3] x86: Implement acpi_get_cpu_uid()
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260313/202603130444.wmvLi9e8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130444.wmvLi9e8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130444.wmvLi9e8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/common.c:2652:5: warning: no previous prototype for 'acpi_get_cpu_uid' [-Wmissing-prototypes]
    2652 | int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
         |     ^~~~~~~~~~~~~~~~


vim +/acpi_get_cpu_uid +2652 arch/x86/kernel/cpu/common.c

  2651	
> 2652	int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
