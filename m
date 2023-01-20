Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820FD20FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674218227; x=1705754227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x49w5QLAEFv46cdUfmueZFP7SnIvVDYkLASTQc+T2Pk=;
  b=fjMtfjA+fS/08U2154NJe8L4Qmzo7nw3fEyX6HkHJsb3sm9kRajCD2P6
   yV6TYTVFEz0+ibiRVJ7zYy4TUGb5zYc/J/p/6AZtr5hY/2qYDgyiq4DHV
   eeLDNfEDZhsPIRFlpJSh192H1ki9A6MLf6PyQit/SJZgm/7ALrlbXEMVR
   44oQVEK6EqYT8sDhh5WDebdBb9LMkS/NvPu96ArzplIYqy8uR8BojXvPg
   f8oPM3Fqq0OlAaItyxi+vub4wC+HZgXP7I/SQeyjXxNNxHXGfQ9pRlmxS
   uD8W5ao3IXliLEbK4O3YqnlkjxdJutTmyQP7gznOuf0eYV1lyTp40f7dI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="411801956"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="411801956"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 04:37:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="749329426"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="749329426"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2023 04:37:00 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIqdf-0002YS-2W;
	Fri, 20 Jan 2023 12:36:59 +0000
Date: Fri, 20 Jan 2023 20:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Lewis <aaronlewis@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sean Christopherson <seanjc@google.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 5972/6912] htmldocs:
 Documentation/virt/kvm/api.rst:5070: WARNING: Unexpected indentation.
Message-ID: <202301202042.herfGxx6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d514392f17fd4d386cfadde7f849d97db4ca1fb0
commit: 651daa44b11c0ea916dee075c8acad002d1b50a2 [5972/6912] kvm: x86/pmu: Introduce masked events to the pmu event filter
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=651daa44b11c0ea916dee075c8acad002d1b50a2
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 651daa44b11c0ea916dee075c8acad002d1b50a2
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/virt/kvm/api.rst:5070: WARNING: Unexpected indentation.

vim +5070 Documentation/virt/kvm/api.rst

  5057	
  5058	  Bits   Description
  5059	  ----   -----------
  5060	  7:0    event select (low bits)
  5061	  15:8   umask match
  5062	  31:16  unused
  5063	  35:32  event select (high bits)
  5064	  36:54  unused
  5065	  55     exclude bit
  5066	  63:56  umask mask
  5067	
  5068	When the guest attempts to program the PMU, these steps are followed in
  5069	determining if the guest should have access:
> 5070	 1. Match the event select from the guest against the filter events.
  5071	 2. If a match is found, match the guest's unit mask to the mask and match
  5072	    values of the included filter events.
  5073	    I.e. (unit mask & mask) == match && !exclude.
  5074	 3. If a match is found, match the guest's unit mask to the mask and match
  5075	    values of the excluded filter events.
  5076	    I.e. (unit mask & mask) == match && exclude.
  5077	 4.
  5078	   a. If an included match is found and an excluded match is not found, filter
  5079	      the event.
  5080	   b. For everything else, do not filter the event.
  5081	 5.
  5082	   a. If the event is filtered and it's an allow list, allow the guest to
  5083	      program the event.
  5084	   b. If the event is filtered and it's a deny list, do not allow the guest to
  5085	      program the event.
  5086	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
