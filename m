Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE58F3B8D7E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 21:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764970285; cv=none; b=r1lVr3Twi3mTZ00Ulf84ud0mfcHV68UhptnbtPt1rlVUWbGvkZB4hQSeL/sYPNgSdhDz2wEpamBTaCgf0KPNIgzaYCWv/csk//qV29x9Uw8sAnSZ+jUfAwdBquz7uPrw5eBVezzp/IIOpsHz9bkiG8jW43oEl0eLYz7tyk7U7LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764970285; c=relaxed/simple;
	bh=VKbtT55ap4Hv+Eganmc0KkEFN9iVNWxvvZquMCm4Vr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DlMYFSwXZoSwVgEb1SKIN+Rzz199s2zqvtqbWQGFQbzUFhcHlK5Wr+kZTUkBZOfUUJOSxDiyByumQHyuVUZLq4yBa4cEcy35+KyzBCULrP9UPmoITaxSEIGMLUT9doAVb2/eDzkWyDhaJy5UruFxMfI5dOypHDp+od04FythdME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0ZOYzoZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0ZOYzoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764970284; x=1796506284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VKbtT55ap4Hv+Eganmc0KkEFN9iVNWxvvZquMCm4Vr4=;
  b=J0ZOYzoZNQSkw2OpyFc3r78wQx7u08dapioTLHATx7Yyr8OO0M7OdEFK
   Pp7ARvoQJydjymNiS8lyPbw086vpH/shOz/9cJAIPKw6MpCflqDZ6zgDk
   0Alji/XwDc21NH/pf7YH1b8VrcjQ54MtFw7jcCDaqlP2AST57+jy01MiB
   YvIHNhpBkU8SFfQ1msSUKNnLdCA3OgHYVQGExd6DCra0CLxb/8oQdS9IG
   WgTxhOMlQAv+tLXmDR0zj8eJl/Asycp78lslECJvDZ7/8Qd+Zd8V5z9JZ
   a7EIis1rVr/+i88WyGCn/4MBSlybYL7d/GhS5RRQF5Ah4QRxnLv6sKNuX
   A==;
X-CSE-ConnectionGUID: DVaX969uQ3qT9WmOFsBCJw==
X-CSE-MsgGUID: goN78IupRjG/cYu90dPmWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84414953"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="84414953"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 13:31:23 -0800
X-CSE-ConnectionGUID: BrS7n5JBQVSlaZBEWTo/MQ==
X-CSE-MsgGUID: S6kdbsFoRSi3SSVAXWjfaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="195644190"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Dec 2025 13:31:22 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRdOZ-00000000FYp-3FG3;
	Fri, 05 Dec 2025 21:31:19 +0000
Date: Sat, 6 Dec 2025 05:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.2 12/32] bpf_oom.c:undefined reference to
 `bpf_struct_ops_link_to_ops'
Message-ID: <202512060504.H13szIhz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.2
head:   84259bf628dec5381b7deb4cd8932b28fd6b7ea3
commit: be141dd2b9c46247d3c6027219b6ce84a01badce [12/32] mm: introduce BPF struct ops for OOM handling
config: i386-buildonly-randconfig-003-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060504.H13szIhz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060504.H13szIhz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060504.H13szIhz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/bpf_oom.o: in function `bpf_handle_oom':
>> bpf_oom.c:(.text+0x37): undefined reference to `bpf_struct_ops_link_to_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
