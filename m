Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3098A386
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 01:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679015572; x=1710551572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AnyVEcjwFOSijgWXOFWW/k/PDntjUPZw4G27TZwqoOo=;
  b=GeEK0EHYZ3uMCSGUCSY8fhzWLK7n0ZSa93D5pqyo9J3tiG4wsDSAIXMk
   KSi3dU+DJIYr0zZB9PFTbr30N+W9FOoXFOYO4n6G54VbqIpEL2sZSFa4B
   Wv+o67WXBBAVHJQC5xX4XZZcp8WtuOldaTYLplJfD86bQdfXAy+ResIIV
   EAv10lfqpub68dcE9Z+vssFEHUjrEsyTF9OYQqGuVZ1widjlJTYPgW0br
   kYeZYAJgKZ9Zm5FbaCR9W9uxRs1/yGhQeVmYEtWnAuyso8f7hNWq4BuNw
   18t6RlQOz4fjPtVLQHgYb2EO6vf8eQi5B6RjKTHqRb3CYjNK4onzTDLde
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317808875"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="317808875"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 18:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="710339658"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="710339658"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Mar 2023 18:12:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcyeH-0008wY-2P;
	Fri, 17 Mar 2023 01:12:49 +0000
Date: Fri, 17 Mar 2023 09:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [cel:topic-rpc-with-tls-upcall 2/19] htmldocs:
 Documentation/networking/tls-handshake.rst:53: WARNING: Inline emphasis
 start-string without end-string.
Message-ID: <202303170958.XI9RY3AN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
head:   12050f1a9e648a9a557c8e5b1c635a2af6a29202
commit: 1daef8af2deecd9c894b8621cc1e833f293821da [2/19] net/tls: Add kernel APIs for requesting a TLSv1.3 handshake
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=1daef8af2deecd9c894b8621cc1e833f293821da
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpc-with-tls-upcall
        git checkout 1daef8af2deecd9c894b8621cc1e833f293821da
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170958.XI9RY3AN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/tls-handshake.rst:53: WARNING: Inline emphasis start-string without end-string.
>> Documentation/networking/tls-handshake.rst:62: WARNING: Definition list ends without a blank line; unexpected unindent.

vim +53 Documentation/networking/tls-handshake.rst

    51	
    52	struct tls_handshake_args {
  > 53		struct socket		*ta_sock;
    54		tls_done_func_t		ta_done;
    55		void			*ta_data;
    56		unsigned int		ta_timeout_ms;
    57		key_serial_t		ta_keyring;
    58		key_serial_t		ta_my_cert;
    59		key_serial_t		ta_my_privkey;
    60		unsigned int		ta_num_peerids;
    61		key_serial_t		ta_my_peerids[5];
  > 62	};
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
