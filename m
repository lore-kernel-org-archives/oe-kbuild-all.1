Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890867C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 03:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676433455; x=1707969455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMre833KJsS+eK+HgH5diSLvUqFTBRhsP25iPfawLCo=;
  b=AfoInBxvZA5PEucrA6aaUAsmqsUCAi3kIBP1xzxtmPmBcV/J+9HCVEtk
   DJqK9XMKr1h2pGZ8Zj4CzKCWEFkzqsRdLusrZrRe5zrUyFUHmQqxU1Sy6
   fFIyF1e0/PhfcoVAoLHQH08INekMF5EwQXZc8gCoi6daiy/0DDXQRwMYi
   Jx5STNENFc9GV09n4DNX635OARvFlsnpmIuoiC1Zzynx+ja8dNgtOqrtX
   X4HjK01R5IB80jCXH/c+rnXlPU+NoANlMBzp64OmWBAKsgMsicanZKZPd
   eWWq8ojiTayC4/ofQc2qNtIK8UUKcblboSdfoULCdf8tEeMlq7vEr1yOE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="393740593"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="393740593"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 19:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="812281075"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="812281075"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2023 19:57:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS8vC-00090V-2G;
	Wed, 15 Feb 2023 03:57:30 +0000
Date: Wed, 15 Feb 2023 11:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Marchevsky <davemarchevsky@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Alexei Starovoitov <ast@kernel.org>, linux-doc@vger.kernel.org
Subject: [ammarfaizi2-block:bpf/bpf-next/master 9/13] htmldocs:
 Documentation/bpf/graph_ds_impl.rst:62: WARNING: Error in "code-block"
 directive:
Message-ID: <202302151123.wUE5FYFx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf-next/master
head:   1f5dfcc78ab4cc06ce7dac9de6c1ed361fde7119
commit: c31315c3aa09297d99cb39e837185ef225586d2b [9/13] bpf, documentation: Add graph documentation for non-owning refs
reproduce:
        # https://github.com/ammarfaizi2/linux-block/commit/c31315c3aa09297d99cb39e837185ef225586d2b
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block bpf/bpf-next/master
        git checkout c31315c3aa09297d99cb39e837185ef225586d2b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302151123.wUE5FYFx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/bpf/graph_ds_impl.rst:62: WARNING: Error in "code-block" directive:

vim +62 Documentation/bpf/graph_ds_impl.rst

    61	
  > 62	.. code-block:: c
    63	        struct node_data {
    64	          long key;
    65	          long data;
    66	          struct bpf_rb_node node;
    67	        };
    68	
    69	        struct bpf_spin_lock glock;
    70	        struct bpf_rb_root groot __contains(node_data, node);
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
