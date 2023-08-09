Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6478E1B7D4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 07:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691565868; x=1723101868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cspJ7jvJS8tO63XMuy3Com/1/AvhoMih9cN25jGwDgE=;
  b=XsoWBKN8177wqp+2biqIKf2jeWaGMxV9E1wgqnE9SjlTiNYl0K2wwbzX
   BbuQuhEkOCX1n2p0xhNshhNQXGoiRivZf9MUm7fJ4fcqR6Xbv83/LjWN1
   2hsz4uaCxGc9ANm716oVtt42SXtEx8Mac07lR3jaLJLEAxhwRpIKkkqU+
   Ky9KR9QEV7cuAEEWdnDz3iDq1o5srxI1H5YNTpQbKNTLvXHwBNBZAQJh8
   TRWK7eUbbHtv2bRXZxyF/rw3Z0A/FN3PUQ9i47Hee2kgS3KkSh4SldqL3
   HZ2SkR2uBb4DObFyieJuHU2eMt/DQ7fZgN5Zkyx6Zr54QuJf2JCd+LZnm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373829247"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="373829247"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 00:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734891257"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="734891257"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2023 00:24:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTdYP-0005uy-15;
	Wed, 09 Aug 2023 07:24:25 +0000
Date: Wed, 9 Aug 2023 15:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [samba-ksmbd:ksmbd-for-next-next 4/4]
 fs/smb/server/ksmbd_work.c:120:5: warning: no previous prototype for
 '__ksmbd_iov_pin_rsp'
Message-ID: <202308091557.5vsUQnAX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   d1cd046a0fbc6d4f7c27ae2dc6a31b1a28d322e8
commit: d1cd046a0fbc6d4f7c27ae2dc6a31b1a28d322e8 [4/4] ksmbd: add support for read in compound
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230809/202308091557.5vsUQnAX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091557.5vsUQnAX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091557.5vsUQnAX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/ksmbd_work.c:120:5: warning: no previous prototype for '__ksmbd_iov_pin_rsp' [-Wmissing-prototypes]
     120 | int __ksmbd_iov_pin_rsp(struct ksmbd_work *work, void *ib, int len,
         |     ^~~~~~~~~~~~~~~~~~~


vim +/__ksmbd_iov_pin_rsp +120 fs/smb/server/ksmbd_work.c

   119	
 > 120	int __ksmbd_iov_pin_rsp(struct ksmbd_work *work, void *ib, int len,
   121				void *aux_buf, unsigned int aux_size)
   122	{
   123		/* Plus rfc_length size on first iov */
   124		if (!work->iov_idx) {
   125			work->iov[work->iov_idx].iov_base = work->response_buf;
   126			work->iov[work->iov_idx].iov_len = 4;
   127			work->iov_cnt++;
   128		}
   129	
   130		ksmbd_realloc_iov_pin(work, ib, len);
   131		inc_rfc1001_len(work->iov[0].iov_base, len);
   132	
   133		if (aux_size) {
   134			struct aux_read *ar;
   135	
   136			ksmbd_realloc_iov_pin(work, aux_buf, aux_size);
   137			inc_rfc1001_len(work->iov[0].iov_base, aux_size);
   138	
   139			ar = kmalloc(sizeof(struct aux_read), GFP_KERNEL);
   140			if (!ar)
   141				return -ENOMEM;
   142	
   143			ar->buf = aux_buf;
   144			list_add(&ar->entry, &work->aux_read_list);
   145		}
   146	
   147		return 0;
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
