Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C8E53B8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688465456; x=1720001456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rHrrDx8bBJniZaIxt6PHmJUfubmy9yZ+Qtw5G9Y30j0=;
  b=SBAJ3YAoO4NkRgYhbeWLeuUAyt33ePwIZLYKfwnJNTYOdCzwNIrJDsEs
   GOG/VDppbfF7XQ05XWorriCDoz6RHoX8spTrgQl0PpGHdKjlJO3su8i79
   AoMr6vWjTpsj9OpNQUUnsTDcYhsH/nNG1THZy+MZ5/phjZXFCxFtPHULV
   AFCW382bRHul9cGILT2AcD99DU75Bimd/gvxtWIQroqwHKbyJd20T5UOL
   8xVN8vq14CiT5k+cur+uXzt5PEGEU8Dlplk6tS6Y9oKFgsZcUC41NQc3E
   jrqzPjD38znw4PGH9z2FRge+FWTg0Vf2FNHk8tV74qMFZqMYe/OVIi2/6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="426769637"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="426769637"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 03:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="965468731"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="965468731"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jul 2023 03:10:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGczh-000IBb-27;
	Tue, 04 Jul 2023 10:10:49 +0000
Date: Tue, 4 Jul 2023 18:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <emmir@google.com>,
	Andrei Vagin <avagin@gmail.com>,
	Danylo Mocherniuk <mdanylo@google.com>,
	Paul Gofman <pgofman@codeweavers.com>,
	Cyrill Gorcunov <gorcunov@gmail.com>,
	Mike Rapoport <rppt@kernel.org>, Nadav Amit <namit@vmware.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Yang Shi <shy828301@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Yun Zhou <yun.zhou@windriver.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Alex Sierra <alex.sierra@amd.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Matthew Wilcox <willy@infradead.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Greg KH <greg@kroah.com>
Subject: Re: [PATCH v22 4/5] mm/pagemap: add documentation of PAGEMAP_SCAN
 IOCTL
Message-ID: <202307041808.b1eQDDHa-lkp@intel.com>
References: <20230628095426.1886064-5-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628095426.1886064-5-usama.anjum@collabora.com>

Hi Muhammad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master next-20230704]
[cannot apply to v6.4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Usama-Anjum/userfaultfd-UFFD_FEATURE_WP_ASYNC/20230628-180259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230628095426.1886064-5-usama.anjum%40collabora.com
patch subject: [PATCH v22 4/5] mm/pagemap: add documentation of PAGEMAP_SCAN IOCTL
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041808.b1eQDDHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307041808.b1eQDDHa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/mm/pagemap.rst:238: WARNING: Unexpected indentation.
>> Documentation/admin-guide/mm/pagemap.rst:240: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +238 Documentation/admin-guide/mm/pagemap.rst

   233	
   234	The ``PAGEMAP_SCAN`` IOCTL on the pagemap file can be used to get or optionally
   235	clear the info about page table entries. The following operations are supported
   236	in this IOCTL:
   237	- Get the information if the pages have been written to (``PAGE_IS_WRITTEN``),
 > 238	  file mapped (``PAGE_IS_FILE``), present (``PAGE_IS_PRESENT``), swapped
   239	  (``PAGE_IS_SWAPPED``) or page has pfn zero (``PAGE_IS_PFNZERO``).
 > 240	- Find pages which have been written to and/or write protect the pages atomically
   241	  (atomic ``PM_SCAN_OP_GET + PM_SCAN_OP_WP``)
   242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
