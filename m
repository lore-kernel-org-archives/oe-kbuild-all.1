Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501546FA2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 19:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680117490; x=1711653490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7pDIQlbSzUdo3NOMdUp85+Vs70H9f8XxcioSgfoeBfY=;
  b=fuYVNeCLlfvBztekE1zSeYTQzABIgoHFBstPrkrX/u/LzaeCkXGWHwb1
   OPnsP/JKSMh9XnVwcym8ZUJXlB3kQaA3FP171jfkWOhuwe+N2+nMi2Pxh
   JCkDuVnvoW+mJTGS+DmBn7p6Lffsmcj4lZ+BiL65J7kGZcmBeGvwBxJrH
   lWerfIrMPq9dM2bftjQc2nny6GUVOgcpyVTLwU7IYe80RQCxGJGfGpeRj
   kOCsGV405M+awV9C19MxgruiDiKaQoM9k1MJ9wfzGL6IJJjWkrN+82eGM
   Vxj6qseAzP0eClp3ksXqhZGBGOoA10sEbmgBcv4Fj1Uz2NIHZ/YJRpuZE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="329463202"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="329463202"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 12:18:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="684407250"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="684407250"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Mar 2023 12:18:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phbJA-000JrU-0I;
	Wed, 29 Mar 2023 19:18:08 +0000
Date: Thu, 30 Mar 2023 03:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-sendpage 28/63] net/tls/tls_main.c:130:18: error:
 'struct msghdr' has no member named 'msg_kflags'; did you mean 'msg_flags'?
Message-ID: <202303300334.Mwk5R4mw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-sendpage
head:   39e48c1301bf2fb60a53912fe5870a253256debc
commit: e1bd0668a8caff3ca2428ad9312c430379b56e46 [28/63] tls: Inline do_tcp_sendpages()
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230330/202303300334.Mwk5R4mw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=e1bd0668a8caff3ca2428ad9312c430379b56e46
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs iov-sendpage
        git checkout e1bd0668a8caff3ca2428ad9312c430379b56e46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300334.Mwk5R4mw-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/tls/tls_main.c: In function 'tls_push_sg':
>> net/tls/tls_main.c:130:18: error: 'struct msghdr' has no member named 'msg_kflags'; did you mean 'msg_flags'?
     130 |                 .msg_kflags     = MSG_SPLICE_PAGES,
         |                  ^~~~~~~~~~
         |                  msg_flags


vim +130 net/tls/tls_main.c

   120	
   121	int tls_push_sg(struct sock *sk,
   122			struct tls_context *ctx,
   123			struct scatterlist *sg,
   124			u16 first_offset,
   125			int flags)
   126	{
   127		struct bio_vec bvec;
   128		struct msghdr msg = {
   129			.msg_flags	= flags | MSG_SENDPAGE_NOTLAST,
 > 130			.msg_kflags	= MSG_SPLICE_PAGES,
   131		};
   132		int ret = 0;
   133		struct page *p;
   134		size_t size;
   135		int offset = first_offset;
   136	
   137		size = sg->length - offset;
   138		offset += sg->offset;
   139	
   140		ctx->splicing_pages = true;
   141		while (1) {
   142			if (sg_is_last(sg))
   143				msg.msg_flags = flags;
   144	
   145			/* is sending application-limited? */
   146			tcp_rate_check_app_limited(sk);
   147			p = sg_page(sg);
   148	retry:
   149			bvec_set_page(&bvec, p, size, offset);
   150			iov_iter_bvec(&msg.msg_iter, ITER_SOURCE, &bvec, 1, size);
   151	
   152			ret = tcp_sendmsg_locked(sk, &msg, size);
   153	
   154			if (ret != size) {
   155				if (ret > 0) {
   156					offset += ret;
   157					size -= ret;
   158					goto retry;
   159				}
   160	
   161				offset -= sg->offset;
   162				ctx->partially_sent_offset = offset;
   163				ctx->partially_sent_record = (void *)sg;
   164				ctx->splicing_pages = false;
   165				return ret;
   166			}
   167	
   168			put_page(p);
   169			sk_mem_uncharge(sk, sg->length);
   170			sg = sg_next(sg);
   171			if (!sg)
   172				break;
   173	
   174			offset = sg->offset;
   175			size = sg->length;
   176		}
   177	
   178		ctx->splicing_pages = false;
   179	
   180		return 0;
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
