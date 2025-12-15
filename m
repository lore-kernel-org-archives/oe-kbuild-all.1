Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231077081F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 04:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765773135; cv=none; b=mvpoFnP0QCBWUjaCdzGeDtvj5WtxOcM9T7VS7AV+G6cyuLd6oArpsLzC2CtkdpCQdzJwo29Ul3StUf0sZ92NeRUTXcGoZR3PHoqZp0bZ0hS/JUHRRRzjRTgRaJJhBnXvW2f0ltql35zSx4qCp0TU4IAmhkJVJgbXTut3JJJhnv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765773135; c=relaxed/simple;
	bh=kHnxj3C1lpOYD4sWdfwWx2VtwWNp8nN2I3VQXzOHAaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9yjHNEc/VKdyunRD/8pZmdqnbHHuR4yYqiOr3+lvbP350p6OUA7uewPKiL7qqI6OOAbnedb0X324ZR1B5cIeXju8P62oPjnuhgb103nDE/0q5IdsmN87z9wnYGGwpBp2hNfqGz3GbErVgfgk7uKYvENH5pjz9dMJfiISpnob98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTPib+wY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTPib+wY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765773134; x=1797309134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kHnxj3C1lpOYD4sWdfwWx2VtwWNp8nN2I3VQXzOHAaU=;
  b=DTPib+wYSv7g4kPTfpUzTTpwBWkyRgJvjcfbhoGHfEH+ZgvKU7tFHwss
   aR29uJ/V6Vd/Y+K0V4OmXFWf8t45U36OQmn+ajnRE7DXuRvGgJkYM/Ovk
   hX8gXccnllg1MeA87mPehqU7XS+jwHSz3qjdUjXNj/4rwwTTzTeyaEgjl
   oluEBmS03EDfF8vps4mJ/t0DSqH26IOVZcoz80s+v5RgR5JMj8jvU0kyQ
   Cwu0CWB60geLJ1ZGAIFoSjbZVdlnH6nmE79rwT8jZoDcHzUFUI0oYY0pf
   RwQW+Si2ZK53lNlQHOuE9LoCRNIU0LfBpXYZmDw2d8eAgmm/A/CXs+Qhc
   w==;
X-CSE-ConnectionGUID: Bk0sqA90RWCjyOBCOmIXrg==
X-CSE-MsgGUID: nACaXSdVROGYyQJNIcbVHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="55233808"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="55233808"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 20:32:13 -0800
X-CSE-ConnectionGUID: LSaBK1gQRv+tce+N+KmgBw==
X-CSE-MsgGUID: ibbkWzCaRnSZmfVa+YQJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228275662"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2025 20:32:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV0Fk-000000009n3-0b8j;
	Mon, 15 Dec 2025 04:32:08 +0000
Date: Mon, 15 Dec 2025 12:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"(maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))" <x86@kernel.org>,
	Jean Delvare <jdelvare@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: Re: [PATCH 3/5] firmware: dmi: Read additional information when
 decoding DMI table
Message-ID: <202512151248.aV3iuNkX-lkp@intel.com>
References: <20251214185309.152614-4-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214185309.152614-4-superm1@kernel.org>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on linus/master tip/auto-latest v6.19-rc1 next-20251215]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello-AMD/firmware-dmi-Correct-an-indexing-error-in-dmi-h/20251215-025606
base:   tip/master
patch link:    https://lore.kernel.org/r/20251214185309.152614-4-superm1%40kernel.org
patch subject: [PATCH 3/5] firmware: dmi: Read additional information when decoding DMI table
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251215/202512151248.aV3iuNkX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151248.aV3iuNkX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151248.aV3iuNkX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/dmi_scan.c: In function 'dmi_save_additional':
>> drivers/firmware/dmi_scan.c:398:21: warning: variable 'strings' set but not used [-Wunused-but-set-variable]
     398 |         const char *strings;
         |                     ^~~~~~~


vim +/strings +398 drivers/firmware/dmi_scan.c

   395	
   396	static void __init dmi_save_additional(const struct dmi_additional_info *info)
   397	{
 > 398		const char *strings;
   399		const u8 *data;
   400		int count = 0;
   401		int i;
   402	
   403		if (!info || info->header.length < 5 + info->count * 5)
   404			return;
   405	
   406		data = info->entries;
   407		strings = (const char *)(data + info->count * 5);
   408	
   409		for (i = 0; i < info->count; i++) {
   410			u8 entry_length = data[i * 5];
   411			u8 string_num = data[i * 5 + 4];
   412			const char *string_ptr;
   413			char *value;
   414			int len;
   415	
   416			if (entry_length < 5 || string_num == 0)
   417				continue;
   418	
   419			string_ptr = dmi_string_nosave(&info->header, string_num);
   420			if (!string_ptr || !*string_ptr)
   421				continue;
   422	
   423			len = strlen(string_ptr);
   424			if (len == 0)
   425				continue;
   426	
   427			value = dmi_alloc(len + 1);
   428			if (!value)
   429				continue;
   430	
   431			strscpy(value, string_ptr, len + 1);
   432	
   433			dmi_save_one_device(DMI_DEV_TYPE_ADDITIONAL, value);
   434			count++;
   435		}
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
