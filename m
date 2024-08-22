Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6961CE71D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 18:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724352242; cv=none; b=WL6kST1IAjQiJuUUTpqowdJC4iEFs5N8MwQc+AoOqnFKNqTQKaZgyStLn8KRQftmMGR+g6Mz+lW5BkWdidggw9RfbGGC/vGBLSXinZkNwaOthkmt3nyTDZGtaIK+pKJm55tz4EUvyQ7YsLTgY0WwhBIYlAdUQwxR2P9RHB7cpIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724352242; c=relaxed/simple;
	bh=XcCU2XxvdZpW07w0QHf5b76/RheOwKYJbOi66AWqulM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L13h1wJidKbB6LM8u8dghiR5u1Gqg0dgBD0l9Pema45cuHHjDd/ytB6L1lc3jsxY+ctKEO9GGI6is9Qg4M8cdlMfMbhM24L/sNoB1x9LRyWoaXtrWoOa154ZdcUMNpAoL5MZNdh5u+kRn1xSQD1mvrT4BRplqhgEgvP053zUWj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBpoDKrV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBpoDKrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724352241; x=1755888241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XcCU2XxvdZpW07w0QHf5b76/RheOwKYJbOi66AWqulM=;
  b=dBpoDKrVJdpzwrcil78e8YI8ljB10qLdMKb1B3C2o6Fplnpk+DlTUuW8
   RJ1H9cgNog/O87n8fHY67aJHTdpy9KIe18NIZOV0aFTRayjLXoK+q2CMl
   E0DvjzTtl2kZ+44Q6bLlZVLWI6D097dFYNx4o0CFM+uY6RHY3Dm8U+Iws
   3f6sBO1ka/45lndj7Dw/1jxKfUvK9YqneHdVwXlK+xj0O7FpTFMDL8C+E
   jF25UTI/Lj1eSWvmBE+2LfRF9nxjxycdvnWuPzqfQQ1DC4gjIt5eMhfY4
   z/Z3xS9xG/v8/83y/Q9deo5bEgjfZ/OZw04fFSFszSh9r2hJjE4PtORPB
   g==;
X-CSE-ConnectionGUID: J7f0x7PRTM+KKqG7te8uUQ==
X-CSE-MsgGUID: W9IiQX7NQQeDL/wkwc5soQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22973354"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22973354"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 11:44:01 -0700
X-CSE-ConnectionGUID: Bvh1fPtTQnGbKl1Zi7hldg==
X-CSE-MsgGUID: bVatWRxdSMKWiWIHlHK0eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66375515"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Aug 2024 11:43:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shCmk-000D5c-2t;
	Thu, 22 Aug 2024 18:43:50 +0000
Date: Fri, 23 Aug 2024 02:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev,
	corbet@lwn.net, arnd@arndb.de, mcgrof@kernel.org, rppt@kernel.org,
	paulmck@kernel.org, thuth@redhat.com, tglx@linutronix.de,
	bp@alien8.de, xiongwei.song@windriver.com, ardb@kernel.org,
	david@redhat.com, vbabka@suse.cz, mhocko@suse.com,
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com,
	pasha.tatashin@soleen.com, souravpanda@google.com,
	keescook@chromium.org, dennis@kernel.org, jhubbard@nvidia.com,
	yuzhao@google.com, vvvvvv@google.com, rostedt@goodmis.org,
	iamjoonsoo.kim@lge.com, rientjes@google.com
Subject: Re: [PATCH 1/5] alloc_tag: load module tags into separate continuous
 memory
Message-ID: <202408230151.2tDiQgTC-lkp@intel.com>
References: <20240819151512.2363698-2-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819151512.2363698-2-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on 651c8c1d735983040bec4f71d0e2e690f3c0fc2d]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/alloc_tag-load-module-tags-into-separate-continuous-memory/20240819-231747
base:   651c8c1d735983040bec4f71d0e2e690f3c0fc2d
patch link:    https://lore.kernel.org/r/20240819151512.2363698-2-surenb%40google.com
patch subject: [PATCH 1/5] alloc_tag: load module tags into separate continuous memory
config: sparc-randconfig-002-20240822 (https://download.01.org/0day-ci/archive/20240823/202408230151.2tDiQgTC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230151.2tDiQgTC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230151.2tDiQgTC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/alloc_tag.c:16:22: error: storage size of 'unloaded_mod' isn't known
      16 | static struct module unloaded_mod;
         |                      ^~~~~~~~~~~~
>> lib/alloc_tag.c:18:22: error: storage size of 'prepend_mod' isn't known
      18 | static struct module prepend_mod;
         |                      ^~~~~~~~~~~


vim +16 lib/alloc_tag.c

    11	
    12	static struct codetag_type *alloc_tag_cttype;
    13	static struct alloc_tag_module_section module_tags;
    14	static struct maple_tree mod_area_mt = MTREE_INIT(mod_area_mt, MT_FLAGS_ALLOC_RANGE);
    15	/* A dummy object used to indicate an unloaded module */
  > 16	static struct module unloaded_mod;
    17	/* A dummy object used to indicate a module prepended area */
  > 18	static struct module prepend_mod;
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
