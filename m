Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E58B8BF3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 19:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678304354; x=1709840354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1wwMzy2aEsK+TVyYGDhSCDd9sVt1YWnVHE7wzJdlPAo=;
  b=OXZBYxdi/IRBaqc+VLvQTi1W5pMP0OFqzm9x98QC+9H/5FQxiOgXHhKk
   En9OglK7EHi8XmIXZoyoOIQr08F/NzvuKS8OonfIExzDfjsgArUCPIzPf
   wg0+WKzEL6Yzfabo+gNT4o5Mf/JgNxE1ymrgO0gcoGxutFCoJR/ob86ku
   nnG8N+hOgfUb6NXg1BWQrEjPccc056v5ZMf2HkZTjJm4Laz1hvun/gmes
   Lx5pMaFMcmHhCiiJuV+xJzsYBX5wcsr/2GLznCEe6Ety0nHBRXJhMGcLG
   rQlmmzGVMKl5IXtLghmWqcdSk1Bw1Pder2mGrU3l/HmtsXlNzHoQw7zc2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315914787"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="315914787"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 11:38:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="851232347"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="851232347"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Mar 2023 11:38:56 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZzcm-0002Mr-0x;
	Wed, 08 Mar 2023 19:38:56 +0000
Date: Thu, 9 Mar 2023 03:38:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 282/288] fs/dlm/midcomms.c:80:38: error:
 'struct dlm_header' has no member named 'h_lockspace'
Message-ID: <202303090317.bMVHyiPP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   22fb0d195f4cb39540659d23b38a609244bfb80a
commit: 230dc2792341c6e33f37fbbed3867224641a6a26 [282/288] fs: dlm: add union in dlm header for lockspace id
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230309/202303090317.bMVHyiPP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=230dc2792341c6e33f37fbbed3867224641a6a26
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout 230dc2792341c6e33f37fbbed3867224641a6a26
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/dlm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090317.bMVHyiPP-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/dlm/midcomms.c: In function 'dlm_process_incoming_buffer':
>> fs/dlm/midcomms.c:80:38: error: 'struct dlm_header' has no member named 'h_lockspace'
      80 |                 lockspace = p->header.h_lockspace;
         |                                      ^
   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from fs/dlm/dlm_internal.h:19,
                    from fs/dlm/midcomms.c:25:
   fs/dlm/midcomms.c:120:46: error: 'struct dlm_header' has no member named 'h_lockspace'
     120 |                 BUG_ON(lockspace != p->header.h_lockspace);
         |                                              ^
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/dlm/midcomms.c:120:17: note: in expansion of macro 'BUG_ON'
     120 |                 BUG_ON(lockspace != p->header.h_lockspace);
         |                 ^~~~~~


vim +80 fs/dlm/midcomms.c

e7fd41792fc0ee David Teigland    2006-01-18   44  
e7fd41792fc0ee David Teigland    2006-01-18   45  /*
e7fd41792fc0ee David Teigland    2006-01-18   46   * Called from the low-level comms layer to process a buffer of
e7fd41792fc0ee David Teigland    2006-01-18   47   * commands.
e7fd41792fc0ee David Teigland    2006-01-18   48   *
e7fd41792fc0ee David Teigland    2006-01-18   49   * Only complete messages are processed here, any "spare" bytes from
e7fd41792fc0ee David Teigland    2006-01-18   50   * the end of a buffer are saved and tacked onto the front of the next
e7fd41792fc0ee David Teigland    2006-01-18   51   * message that comes in. I doubt this will happen very often but we
e7fd41792fc0ee David Teigland    2006-01-18   52   * need to be able to cope with it and I don't want the task to be waiting
e7fd41792fc0ee David Teigland    2006-01-18   53   * for packets to come in when there is useful work to be done.
e7fd41792fc0ee David Teigland    2006-01-18   54   */
e7fd41792fc0ee David Teigland    2006-01-18   55  
e7fd41792fc0ee David Teigland    2006-01-18   56  int dlm_process_incoming_buffer(int nodeid, const void *base,
e7fd41792fc0ee David Teigland    2006-01-18   57  				unsigned offset, unsigned len, unsigned limit)
e7fd41792fc0ee David Teigland    2006-01-18   58  {
e7847d35ac39fe Fabio M. Di Nitto 2008-01-30   59  	union {
e7847d35ac39fe Fabio M. Di Nitto 2008-01-30   60  		unsigned char __buf[DLM_INBUF_LEN];
e7847d35ac39fe Fabio M. Di Nitto 2008-01-30   61  		/* this is to force proper alignment on some arches */
eef7d739c218cb Al Viro           2008-01-25   62  		union dlm_packet p;
e7847d35ac39fe Fabio M. Di Nitto 2008-01-30   63  	} __tmp;
eef7d739c218cb Al Viro           2008-01-25   64  	union dlm_packet *p = &__tmp.p;
e7fd41792fc0ee David Teigland    2006-01-18   65  	int ret = 0;
e7fd41792fc0ee David Teigland    2006-01-18   66  	int err = 0;
e7fd41792fc0ee David Teigland    2006-01-18   67  	uint16_t msglen;
e7fd41792fc0ee David Teigland    2006-01-18   68  	uint32_t lockspace;
e7fd41792fc0ee David Teigland    2006-01-18   69  
e7fd41792fc0ee David Teigland    2006-01-18   70  	while (len > sizeof(struct dlm_header)) {
e7fd41792fc0ee David Teigland    2006-01-18   71  
e7fd41792fc0ee David Teigland    2006-01-18   72  		/* Copy just the header to check the total length.  The
e7fd41792fc0ee David Teigland    2006-01-18   73  		   message may wrap around the end of the buffer back to the
e7fd41792fc0ee David Teigland    2006-01-18   74  		   start, so we need to use a temp buffer and copy_from_cb. */
e7fd41792fc0ee David Teigland    2006-01-18   75  
eef7d739c218cb Al Viro           2008-01-25   76  		copy_from_cb(p, base, offset, sizeof(struct dlm_header),
e7fd41792fc0ee David Teigland    2006-01-18   77  			     limit);
e7fd41792fc0ee David Teigland    2006-01-18   78  
eef7d739c218cb Al Viro           2008-01-25   79  		msglen = le16_to_cpu(p->header.h_length);
eef7d739c218cb Al Viro           2008-01-25  @80  		lockspace = p->header.h_lockspace;
e7fd41792fc0ee David Teigland    2006-01-18   81  
e7fd41792fc0ee David Teigland    2006-01-18   82  		err = -EINVAL;
e7fd41792fc0ee David Teigland    2006-01-18   83  		if (msglen < sizeof(struct dlm_header))
e7fd41792fc0ee David Teigland    2006-01-18   84  			break;
eef7d739c218cb Al Viro           2008-01-25   85  		if (p->header.h_cmd == DLM_MSG) {
eef7d739c218cb Al Viro           2008-01-25   86  			if (msglen < sizeof(struct dlm_message))
eef7d739c218cb Al Viro           2008-01-25   87  				break;
eef7d739c218cb Al Viro           2008-01-25   88  		} else {
eef7d739c218cb Al Viro           2008-01-25   89  			if (msglen < sizeof(struct dlm_rcom))
eef7d739c218cb Al Viro           2008-01-25   90  				break;
eef7d739c218cb Al Viro           2008-01-25   91  		}
e7fd41792fc0ee David Teigland    2006-01-18   92  		err = -E2BIG;
68c817a1c4e21b David Teigland    2007-01-09   93  		if (msglen > dlm_config.ci_buffer_size) {
e7fd41792fc0ee David Teigland    2006-01-18   94  			log_print("message size %d from %d too big, buf len %d",
e7fd41792fc0ee David Teigland    2006-01-18   95  				  msglen, nodeid, len);
e7fd41792fc0ee David Teigland    2006-01-18   96  			break;
e7fd41792fc0ee David Teigland    2006-01-18   97  		}
e7fd41792fc0ee David Teigland    2006-01-18   98  		err = 0;
e7fd41792fc0ee David Teigland    2006-01-18   99  
e7fd41792fc0ee David Teigland    2006-01-18  100  		/* If only part of the full message is contained in this
e7fd41792fc0ee David Teigland    2006-01-18  101  		   buffer, then do nothing and wait for lowcomms to call
e7fd41792fc0ee David Teigland    2006-01-18  102  		   us again later with more data.  We return 0 meaning
e7fd41792fc0ee David Teigland    2006-01-18  103  		   we've consumed none of the input buffer. */
e7fd41792fc0ee David Teigland    2006-01-18  104  
e7fd41792fc0ee David Teigland    2006-01-18  105  		if (msglen > len)
e7fd41792fc0ee David Teigland    2006-01-18  106  			break;
e7fd41792fc0ee David Teigland    2006-01-18  107  
e7fd41792fc0ee David Teigland    2006-01-18  108  		/* Allocate a larger temp buffer if the full message won't fit
e7fd41792fc0ee David Teigland    2006-01-18  109  		   in the buffer on the stack (which should work for most
e7fd41792fc0ee David Teigland    2006-01-18  110  		   ordinary messages). */
e7fd41792fc0ee David Teigland    2006-01-18  111  
eef7d739c218cb Al Viro           2008-01-25  112  		if (msglen > sizeof(__tmp) && p == &__tmp.p) {
d6d7b702a3a1ca Steven Whitehouse 2008-11-12  113  			p = kmalloc(dlm_config.ci_buffer_size, GFP_NOFS);
eef7d739c218cb Al Viro           2008-01-25  114  			if (p == NULL)
e7fd41792fc0ee David Teigland    2006-01-18  115  				return ret;
e7fd41792fc0ee David Teigland    2006-01-18  116  		}
e7fd41792fc0ee David Teigland    2006-01-18  117  
eef7d739c218cb Al Viro           2008-01-25  118  		copy_from_cb(p, base, offset, msglen, limit);
e7fd41792fc0ee David Teigland    2006-01-18  119  
eef7d739c218cb Al Viro           2008-01-25  120  		BUG_ON(lockspace != p->header.h_lockspace);
e7fd41792fc0ee David Teigland    2006-01-18  121  
e7fd41792fc0ee David Teigland    2006-01-18  122  		ret += msglen;
e7fd41792fc0ee David Teigland    2006-01-18  123  		offset += msglen;
e7fd41792fc0ee David Teigland    2006-01-18  124  		offset &= (limit - 1);
e7fd41792fc0ee David Teigland    2006-01-18  125  		len -= msglen;
e7fd41792fc0ee David Teigland    2006-01-18  126  
eef7d739c218cb Al Viro           2008-01-25  127  		dlm_receive_buffer(p, nodeid);
e7fd41792fc0ee David Teigland    2006-01-18  128  	}
e7fd41792fc0ee David Teigland    2006-01-18  129  
eef7d739c218cb Al Viro           2008-01-25  130  	if (p != &__tmp.p)
eef7d739c218cb Al Viro           2008-01-25  131  		kfree(p);
e7fd41792fc0ee David Teigland    2006-01-18  132  
e7fd41792fc0ee David Teigland    2006-01-18  133  	return err ? err : ret;
e7fd41792fc0ee David Teigland    2006-01-18  134  }
e7fd41792fc0ee David Teigland    2006-01-18  135  

:::::: The code at line 80 was first introduced by commit
:::::: eef7d739c218cb2546cf95686db77de0d76e4122 dlm: dlm_process_incoming_buffer() fixes

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: David Teigland <teigland@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
