Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FBB2528E1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753536047; cv=none; b=fni2y9irIncwNPC5AZDRcZDxWakR1lAHNohsXKXZNnQAQ/0JTfGChfqYXqteVb3jkpkW/X8RjGYxZHHDvs/n7D3ZMU5PuLaTHUK2CjnYxD+KS6zerFdrb+SH7EzyXFY4OQD1FqnPZ7jQnuIBFp3hFPiUGXKLCmtx9v533NiOkSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753536047; c=relaxed/simple;
	bh=1JouOeeiVZurkDt7Bj4FmoMcNM1Klq+ZyJBB5eSebNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yvy3ewkDcNrqEDmi8z68ahCYLDDFQKJqRJB43LIk5wHOLh2I7eya3cq4X5iL5qilG3jA2M67G8qz+RYM04m+5QbocgK4Tymf53nLI0fWmISZV9gG4l6MPaORQtjYyQv6vF6RiKuqPDE13KlrQfJgtL6E3z0Wbh0Ggve3ppWBLXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVoA2LhS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVoA2LhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753536045; x=1785072045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1JouOeeiVZurkDt7Bj4FmoMcNM1Klq+ZyJBB5eSebNQ=;
  b=RVoA2LhS7upubdsHHvyTJ5ukkJrSwDfQyeRPSTQMRATfA94U2lsjLRzi
   1OtBvJQL3Cbv1p/2QnqnQP5Bv+vs/X4NLIWLaHDhbASvzpbniQyX5XqpQ
   DoHcWsSXOyCDAIMR6HmTnMpXOhe0wVlbG4OHCNjQM5QrACBuRnlBnkGef
   Iti0xA1fXXyDHw/qDQvC4HzZLw9zHR4HhZOCxYxo0stqwUWrnmHuhDTWm
   AzGwwcrroobqJn9XPGr9UVBxYMScVj9U5md/terkILTHM3WA41A6DQeQc
   /93c1CdIRnusgSowZQetIJu8EaOCO2T4FHLOC3fNi4OnX3Hsfynn30y/z
   w==;
X-CSE-ConnectionGUID: s9vXPSfvSzGwLYw9MY0JMw==
X-CSE-MsgGUID: iX7PHoGlTpSTi6psn82nGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55549460"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55549460"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 06:20:44 -0700
X-CSE-ConnectionGUID: yaWK6MC2RdCmzZEhZMfl4g==
X-CSE-MsgGUID: mSLBtiM9TWatDVPZVIW+6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166918380"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jul 2025 06:20:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufepM-000Lzt-2z;
	Sat, 26 Jul 2025 13:20:40 +0000
Date: Sat, 26 Jul 2025 21:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sandeen:convert-9p 4/4] fs/9p/v9fs.c:466:59: error: passing
 argument 2 of 'v9fs_cache_session_get_cookie' from incompatible pointer type
Message-ID: <202507262155.8BV93ajE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git convert-9p
head:   4a72a2292eafad1371bc73defec4fdea64ea6de7
commit: 4a72a2292eafad1371bc73defec4fdea64ea6de7 [4/4] 9p: convert to the new mount API
config: loongarch-randconfig-001-20250725 (https://download.01.org/0day-ci/archive/20250726/202507262155.8BV93ajE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507262155.8BV93ajE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507262155.8BV93ajE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/9p/v9fs.c: In function 'v9fs_parse_param':
   fs/9p/v9fs.c:195:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     195 |         int ret = 0;
         |             ^~~
   fs/9p/v9fs.c: In function 'v9fs_session_init':
>> fs/9p/v9fs.c:466:59: error: passing argument 2 of 'v9fs_cache_session_get_cookie' from incompatible pointer type [-Wincompatible-pointer-types]
     466 |                 rc = v9fs_cache_session_get_cookie(v9ses, dev_name);
         |                                                           ^~~~~~~~
         |                                                           |
         |                                                           const char * (*)(const struct device *)
   In file included from fs/9p/v9fs.c:25:
   fs/9p/cache.h:15:55: note: expected 'const char *' but argument is of type 'const char * (*)(const struct device *)'
      15 |                                           const char *dev_name);
         |                                           ~~~~~~~~~~~~^~~~~~~~
   In file included from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/bpf.h:30,
                    from include/linux/security.h:35,
                    from include/linux/fs_context.h:14,
                    from include/linux/fs_parser.h:11,
                    from fs/9p/v9fs.c:16:
   include/linux/device.h:741:27: note: 'dev_name' declared here
     741 | static inline const char *dev_name(const struct device *dev)
         |                           ^~~~~~~~
--
   In file included from fs/9p/v9fs.h:14,
                    from fs/9p/cache.c:16:
>> include/net/9p/transport.h:55:30: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      55 |         int (*create)(struct p9_client *client,
         |                              ^~~~~~~~~
   include/net/9p/transport.h:57:30: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      57 |         void (*close)(struct p9_client *client);
         |                              ^~~~~~~~~
>> include/net/9p/transport.h:58:57: warning: 'struct p9_req_t' declared inside parameter list will not be visible outside of this definition or declaration
      58 |         int (*request)(struct p9_client *client, struct p9_req_t *req);
         |                                                         ^~~~~~~~
   include/net/9p/transport.h:58:31: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      58 |         int (*request)(struct p9_client *client, struct p9_req_t *req);
         |                               ^~~~~~~~~
   include/net/9p/transport.h:59:56: warning: 'struct p9_req_t' declared inside parameter list will not be visible outside of this definition or declaration
      59 |         int (*cancel)(struct p9_client *client, struct p9_req_t *req);
         |                                                        ^~~~~~~~
   include/net/9p/transport.h:59:30: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      59 |         int (*cancel)(struct p9_client *client, struct p9_req_t *req);
         |                              ^~~~~~~~~
   include/net/9p/transport.h:60:59: warning: 'struct p9_req_t' declared inside parameter list will not be visible outside of this definition or declaration
      60 |         int (*cancelled)(struct p9_client *client, struct p9_req_t *req);
         |                                                           ^~~~~~~~
   include/net/9p/transport.h:60:33: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      60 |         int (*cancelled)(struct p9_client *client, struct p9_req_t *req);
         |                                 ^~~~~~~~~
   include/net/9p/transport.h:61:60: warning: 'struct p9_req_t' declared inside parameter list will not be visible outside of this definition or declaration
      61 |         int (*zc_request)(struct p9_client *client, struct p9_req_t *req,
         |                                                            ^~~~~~~~
   include/net/9p/transport.h:61:34: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      61 |         int (*zc_request)(struct p9_client *client, struct p9_req_t *req,
         |                                  ^~~~~~~~~
   include/net/9p/transport.h:64:56: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      64 |         int (*show_options)(struct seq_file *m, struct p9_client *client);
         |                                                        ^~~~~~~~~
   fs/9p/v9fs.h:110:64: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     110 | static inline struct fscache_volume *v9fs_session_cache(struct v9fs_session_info *v9ses)
         |                                                                ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h: In function 'v9fs_session_cache':
   fs/9p/v9fs.h:113:21: error: invalid use of undefined type 'struct v9fs_session_info'
     113 |         return v9ses->fscache;
         |                     ^~
   fs/9p/v9fs.h: At top level:
   fs/9p/v9fs.h:124:41: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     124 | struct p9_fid *v9fs_session_init(struct v9fs_session_info *v9ses,
         |                                         ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h:126:39: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     126 | extern void v9fs_session_close(struct v9fs_session_info *v9ses);
         |                                       ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h:127:40: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     127 | extern void v9fs_session_cancel(struct v9fs_session_info *v9ses);
         |                                        ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h:128:46: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     128 | extern void v9fs_session_begin_cancel(struct v9fs_session_info *v9ses);
         |                                              ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h:137:49: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     137 | extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
         |                                                 ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h:144:54: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     144 | extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
         |                                                      ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h: In function 'v9fs_proto_dotu':
   fs/9p/v9fs.h:167:21: error: invalid use of undefined type 'struct v9fs_session_info'
     167 |         return v9ses->flags & V9FS_PROTO_2000U;
         |                     ^~
   fs/9p/v9fs.h: In function 'v9fs_proto_dotl':
   fs/9p/v9fs.h:172:21: error: invalid use of undefined type 'struct v9fs_session_info'
     172 |         return v9ses->flags & V9FS_PROTO_2000L;
         |                     ^~
   fs/9p/v9fs.h: In function 'v9fs_get_inode_from_fid':
   fs/9p/v9fs.h:188:49: error: passing argument 1 of 'v9fs_inode_from_fid_dotl' from incompatible pointer type [-Wincompatible-pointer-types]
     188 |                 return v9fs_inode_from_fid_dotl(v9ses, fid, sb, 0);
         |                                                 ^~~~~
         |                                                 |
         |                                                 struct v9fs_session_info *
   fs/9p/v9fs.h:144:73: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     144 | extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/9p/v9fs.h:190:44: error: passing argument 1 of 'v9fs_inode_from_fid' from incompatible pointer type [-Wincompatible-pointer-types]
     190 |                 return v9fs_inode_from_fid(v9ses, fid, sb, 0);
         |                                            ^~~~~
         |                                            |
         |                                            struct v9fs_session_info *
   fs/9p/v9fs.h:137:68: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     137 | extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/9p/v9fs.h: In function 'v9fs_get_new_inode_from_fid':
   fs/9p/v9fs.h:206:49: error: passing argument 1 of 'v9fs_inode_from_fid_dotl' from incompatible pointer type [-Wincompatible-pointer-types]
     206 |                 return v9fs_inode_from_fid_dotl(v9ses, fid, sb, 1);
         |                                                 ^~~~~
         |                                                 |
         |                                                 struct v9fs_session_info *
   fs/9p/v9fs.h:144:73: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     144 | extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/9p/v9fs.h:208:44: error: passing argument 1 of 'v9fs_inode_from_fid' from incompatible pointer type [-Wincompatible-pointer-types]
     208 |                 return v9fs_inode_from_fid(v9ses, fid, sb, 1);
         |                                            ^~~~~
         |                                            |
         |                                            struct v9fs_session_info *
   fs/9p/v9fs.h:137:68: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     137 | extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/9p/cache.c: In function 'v9fs_cache_session_get_cookie':
   fs/9p/cache.c:26:41: error: invalid use of undefined type 'struct v9fs_session_info'
      26 |                          dev_name, v9ses->cachetag ?: v9ses->aname);
         |                                         ^~
   fs/9p/cache.c:26:60: error: invalid use of undefined type 'struct v9fs_session_info'
      26 |                          dev_name, v9ses->cachetag ?: v9ses->aname);
--
>> Warning: net/9p/trans_rdma.c:523 function parameter 'fc' not described in 'rdma_create_trans'
   Warning: net/9p/trans_rdma.c:523 Excess function parameter 'addr' description in 'rdma_create_trans'
   Warning: net/9p/trans_rdma.c:523 Excess function parameter 'args' description in 'rdma_create_trans'
--
   In file included from v9fs.h:14,
                    from cache.c:16:
>> include/net/9p/transport.h:55:30: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      55 |         int (*create)(struct p9_client *client,
         |                              ^~~~~~~~~
   include/net/9p/transport.h:57:30: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      57 |         void (*close)(struct p9_client *client);
         |                              ^~~~~~~~~
>> include/net/9p/transport.h:58:57: warning: 'struct p9_req_t' declared inside parameter list will not be visible outside of this definition or declaration
      58 |         int (*request)(struct p9_client *client, struct p9_req_t *req);
         |                                                         ^~~~~~~~
   include/net/9p/transport.h:58:31: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      58 |         int (*request)(struct p9_client *client, struct p9_req_t *req);
         |                               ^~~~~~~~~
   include/net/9p/transport.h:59:56: warning: 'struct p9_req_t' declared inside parameter list will not be visible outside of this definition or declaration
      59 |         int (*cancel)(struct p9_client *client, struct p9_req_t *req);
         |                                                        ^~~~~~~~
   include/net/9p/transport.h:59:30: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      59 |         int (*cancel)(struct p9_client *client, struct p9_req_t *req);
         |                              ^~~~~~~~~
   include/net/9p/transport.h:60:59: warning: 'struct p9_req_t' declared inside parameter list will not be visible outside of this definition or declaration
      60 |         int (*cancelled)(struct p9_client *client, struct p9_req_t *req);
         |                                                           ^~~~~~~~
   include/net/9p/transport.h:60:33: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      60 |         int (*cancelled)(struct p9_client *client, struct p9_req_t *req);
         |                                 ^~~~~~~~~
   include/net/9p/transport.h:61:60: warning: 'struct p9_req_t' declared inside parameter list will not be visible outside of this definition or declaration
      61 |         int (*zc_request)(struct p9_client *client, struct p9_req_t *req,
         |                                                            ^~~~~~~~
   include/net/9p/transport.h:61:34: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      61 |         int (*zc_request)(struct p9_client *client, struct p9_req_t *req,
         |                                  ^~~~~~~~~
   include/net/9p/transport.h:64:56: warning: 'struct p9_client' declared inside parameter list will not be visible outside of this definition or declaration
      64 |         int (*show_options)(struct seq_file *m, struct p9_client *client);
         |                                                        ^~~~~~~~~
   v9fs.h:110:64: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     110 | static inline struct fscache_volume *v9fs_session_cache(struct v9fs_session_info *v9ses)
         |                                                                ^~~~~~~~~~~~~~~~~
   v9fs.h: In function 'v9fs_session_cache':
   v9fs.h:113:21: error: invalid use of undefined type 'struct v9fs_session_info'
     113 |         return v9ses->fscache;
         |                     ^~
   v9fs.h: At top level:
   v9fs.h:124:41: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     124 | struct p9_fid *v9fs_session_init(struct v9fs_session_info *v9ses,
         |                                         ^~~~~~~~~~~~~~~~~
   v9fs.h:126:39: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     126 | extern void v9fs_session_close(struct v9fs_session_info *v9ses);
         |                                       ^~~~~~~~~~~~~~~~~
   v9fs.h:127:40: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     127 | extern void v9fs_session_cancel(struct v9fs_session_info *v9ses);
         |                                        ^~~~~~~~~~~~~~~~~
   v9fs.h:128:46: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     128 | extern void v9fs_session_begin_cancel(struct v9fs_session_info *v9ses);
         |                                              ^~~~~~~~~~~~~~~~~
   v9fs.h:137:49: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     137 | extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
         |                                                 ^~~~~~~~~~~~~~~~~
   v9fs.h:144:54: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     144 | extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
         |                                                      ^~~~~~~~~~~~~~~~~
   v9fs.h: In function 'v9fs_proto_dotu':
   v9fs.h:167:21: error: invalid use of undefined type 'struct v9fs_session_info'
     167 |         return v9ses->flags & V9FS_PROTO_2000U;
         |                     ^~
   v9fs.h: In function 'v9fs_proto_dotl':
   v9fs.h:172:21: error: invalid use of undefined type 'struct v9fs_session_info'
     172 |         return v9ses->flags & V9FS_PROTO_2000L;
         |                     ^~
   v9fs.h: In function 'v9fs_get_inode_from_fid':
   v9fs.h:188:49: error: passing argument 1 of 'v9fs_inode_from_fid_dotl' from incompatible pointer type [-Wincompatible-pointer-types]
     188 |                 return v9fs_inode_from_fid_dotl(v9ses, fid, sb, 0);
         |                                                 ^~~~~
         |                                                 |
         |                                                 struct v9fs_session_info *
   v9fs.h:144:73: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     144 | extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   v9fs.h:190:44: error: passing argument 1 of 'v9fs_inode_from_fid' from incompatible pointer type [-Wincompatible-pointer-types]
     190 |                 return v9fs_inode_from_fid(v9ses, fid, sb, 0);
         |                                            ^~~~~
         |                                            |
         |                                            struct v9fs_session_info *
   v9fs.h:137:68: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     137 | extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   v9fs.h: In function 'v9fs_get_new_inode_from_fid':
   v9fs.h:206:49: error: passing argument 1 of 'v9fs_inode_from_fid_dotl' from incompatible pointer type [-Wincompatible-pointer-types]
     206 |                 return v9fs_inode_from_fid_dotl(v9ses, fid, sb, 1);
         |                                                 ^~~~~
         |                                                 |
         |                                                 struct v9fs_session_info *
   v9fs.h:144:73: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     144 | extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   v9fs.h:208:44: error: passing argument 1 of 'v9fs_inode_from_fid' from incompatible pointer type [-Wincompatible-pointer-types]
     208 |                 return v9fs_inode_from_fid(v9ses, fid, sb, 1);
         |                                            ^~~~~
         |                                            |
         |                                            struct v9fs_session_info *
   v9fs.h:137:68: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     137 | extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   cache.c: In function 'v9fs_cache_session_get_cookie':
   cache.c:26:41: error: invalid use of undefined type 'struct v9fs_session_info'
      26 |                          dev_name, v9ses->cachetag ?: v9ses->aname);
         |                                         ^~
   cache.c:26:60: error: invalid use of undefined type 'struct v9fs_session_info'
      26 |                          dev_name, v9ses->cachetag ?: v9ses->aname);


vim +/v9fs_cache_session_get_cookie +466 fs/9p/v9fs.c

9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  382  
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  383  /**
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  384   * v9fs_session_init - initialize session
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  385   * @v9ses: session information structure
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  386   * @dev_name: device being mounted
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  387   * @data: options
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  388   *
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  389   */
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  390  
bd238fb431f319 Latchesar Ionkov             2007-07-10  391  struct p9_fid *v9fs_session_init(struct v9fs_session_info *v9ses,
4a72a2292eafad Eric Sandeen                 2025-07-24  392  		  struct fs_context *fc)
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  393  {
bd238fb431f319 Latchesar Ionkov             2007-07-10  394  	struct p9_fid *fid;
412a19b64ad17f Tejun Heo                    2015-06-08  395  	int rc = -ENOMEM;
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  396  
a534c8d15b1f1d Aneesh Kumar K.V             2010-06-30  397  	init_rwsem(&v9ses->rename_sem);
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  398  
4a72a2292eafad Eric Sandeen                 2025-07-24  399  	v9ses->clnt = p9_client_create(fc);
bd238fb431f319 Latchesar Ionkov             2007-07-10  400  	if (IS_ERR(v9ses->clnt)) {
412a19b64ad17f Tejun Heo                    2015-06-08  401  		rc = PTR_ERR(v9ses->clnt);
5d3851530d6d68 Joe Perches                  2011-11-28  402  		p9_debug(P9_DEBUG_ERROR, "problem initializing 9p client\n");
71304feba33f4b Jan Kara                     2017-04-12  403  		goto err_names;
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  404  	}
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  405  
4a72a2292eafad Eric Sandeen                 2025-07-24  406  	/*
4a72a2292eafad Eric Sandeen                 2025-07-24  407  	 * Initialize flags on the real v9ses. v9fs_apply_options below
4a72a2292eafad Eric Sandeen                 2025-07-24  408  	 * will |= the additional flags from parsed options.
4a72a2292eafad Eric Sandeen                 2025-07-24  409  	 */
6752a1ebd13f69 Venkateswararao Jujjuri (JV  2011-01-26  410) 	v9ses->flags = V9FS_ACCESS_USER;
6752a1ebd13f69 Venkateswararao Jujjuri (JV  2011-01-26  411) 
6752a1ebd13f69 Venkateswararao Jujjuri (JV  2011-01-26  412) 	if (p9_is_proto_dotl(v9ses->clnt)) {
6752a1ebd13f69 Venkateswararao Jujjuri (JV  2011-01-26  413) 		v9ses->flags = V9FS_ACCESS_CLIENT;
476ada04363516 Sripathi Kodi                2010-03-17  414  		v9ses->flags |= V9FS_PROTO_2000L;
6752a1ebd13f69 Venkateswararao Jujjuri (JV  2011-01-26  415) 	} else if (p9_is_proto_dotu(v9ses->clnt)) {
476ada04363516 Sripathi Kodi                2010-03-17  416  		v9ses->flags |= V9FS_PROTO_2000U;
6752a1ebd13f69 Venkateswararao Jujjuri (JV  2011-01-26  417) 	}
6752a1ebd13f69 Venkateswararao Jujjuri (JV  2011-01-26  418) 
4a72a2292eafad Eric Sandeen                 2025-07-24  419  	v9fs_apply_options(v9ses, fc);
ba17674fe02909 Latchesar Ionkov             2007-10-17  420  
fbedadc16e5c88 Eric Van Hensbergen          2008-10-13  421  	v9ses->maxdata = v9ses->clnt->msize - P9_IOHDRSZ;
8a0dc95fd976a0 Eric Van Hensbergen          2008-02-06  422  
76381a42e4a560 Aneesh Kumar K.V             2010-09-28  423  	if (!v9fs_proto_dotl(v9ses) &&
76381a42e4a560 Aneesh Kumar K.V             2010-09-28  424  	    ((v9ses->flags & V9FS_ACCESS_MASK) == V9FS_ACCESS_CLIENT)) {
76381a42e4a560 Aneesh Kumar K.V             2010-09-28  425  		/*
76381a42e4a560 Aneesh Kumar K.V             2010-09-28  426  		 * We support ACCESS_CLIENT only for dotl.
76381a42e4a560 Aneesh Kumar K.V             2010-09-28  427  		 * Fall back to ACCESS_USER
76381a42e4a560 Aneesh Kumar K.V             2010-09-28  428  		 */
76381a42e4a560 Aneesh Kumar K.V             2010-09-28  429  		v9ses->flags &= ~V9FS_ACCESS_MASK;
76381a42e4a560 Aneesh Kumar K.V             2010-09-28  430  		v9ses->flags |= V9FS_ACCESS_USER;
76381a42e4a560 Aneesh Kumar K.V             2010-09-28  431  	}
76381a42e4a560 Aneesh Kumar K.V             2010-09-28  432  	/*FIXME !! */
ba17674fe02909 Latchesar Ionkov             2007-10-17  433  	/* for legacy mode, fall back to V9FS_ACCESS_ANY */
9ffaf63e34821e Aneesh Kumar K.V             2010-06-01  434  	if (!(v9fs_proto_dotu(v9ses) || v9fs_proto_dotl(v9ses)) &&
ba17674fe02909 Latchesar Ionkov             2007-10-17  435  		((v9ses->flags&V9FS_ACCESS_MASK) == V9FS_ACCESS_USER)) {
ba17674fe02909 Latchesar Ionkov             2007-10-17  436  
ba17674fe02909 Latchesar Ionkov             2007-10-17  437  		v9ses->flags &= ~V9FS_ACCESS_MASK;
ba17674fe02909 Latchesar Ionkov             2007-10-17  438  		v9ses->flags |= V9FS_ACCESS_ANY;
76ed23a5d703d9 Eric W. Biederman            2013-01-30  439  		v9ses->uid = INVALID_UID;
ba17674fe02909 Latchesar Ionkov             2007-10-17  440  	}
e782ef71097e83 Venkateswararao Jujjuri (JV  2011-01-25  441) 	if (!v9fs_proto_dotl(v9ses) ||
e782ef71097e83 Venkateswararao Jujjuri (JV  2011-01-25  442) 		!((v9ses->flags & V9FS_ACCESS_MASK) == V9FS_ACCESS_CLIENT)) {
e782ef71097e83 Venkateswararao Jujjuri (JV  2011-01-25  443) 		/*
e782ef71097e83 Venkateswararao Jujjuri (JV  2011-01-25  444) 		 * We support ACL checks on clinet only if the protocol is
e782ef71097e83 Venkateswararao Jujjuri (JV  2011-01-25  445) 		 * 9P2000.L and access is V9FS_ACCESS_CLIENT.
e782ef71097e83 Venkateswararao Jujjuri (JV  2011-01-25  446) 		 */
e782ef71097e83 Venkateswararao Jujjuri (JV  2011-01-25  447) 		v9ses->flags &= ~V9FS_ACL_MASK;
e782ef71097e83 Venkateswararao Jujjuri (JV  2011-01-25  448) 	}
ba17674fe02909 Latchesar Ionkov             2007-10-17  449  
f791f7c5e35487 Eric W. Biederman            2013-01-29  450  	fid = p9_client_attach(v9ses->clnt, NULL, v9ses->uname, INVALID_UID,
ba17674fe02909 Latchesar Ionkov             2007-10-17  451  							v9ses->aname);
bd238fb431f319 Latchesar Ionkov             2007-07-10  452  	if (IS_ERR(fid)) {
412a19b64ad17f Tejun Heo                    2015-06-08  453  		rc = PTR_ERR(fid);
5d3851530d6d68 Joe Perches                  2011-11-28  454  		p9_debug(P9_DEBUG_ERROR, "cannot attach\n");
412a19b64ad17f Tejun Heo                    2015-06-08  455  		goto err_clnt;
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  456  	}
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  457  
ba17674fe02909 Latchesar Ionkov             2007-10-17  458  	if ((v9ses->flags & V9FS_ACCESS_MASK) == V9FS_ACCESS_SINGLE)
ba17674fe02909 Latchesar Ionkov             2007-10-17  459  		fid->uid = v9ses->uid;
ba17674fe02909 Latchesar Ionkov             2007-10-17  460  	else
b464255699077c Eric W. Biederman            2013-01-30  461  		fid->uid = INVALID_UID;
ba17674fe02909 Latchesar Ionkov             2007-10-17  462  
60e78d2c993e58 Abhishek Kulkarni            2009-09-23  463  #ifdef CONFIG_9P_FSCACHE
60e78d2c993e58 Abhishek Kulkarni            2009-09-23  464  	/* register the session for caching */
4eb3117888a923 Eric Van Hensbergen          2023-03-27  465  	if (v9ses->cache & CACHE_FSCACHE) {
24e42e32d347f0 David Howells                2020-11-18 @466  		rc = v9fs_cache_session_get_cookie(v9ses, dev_name);
24e42e32d347f0 David Howells                2020-11-18  467  		if (rc < 0)
24e42e32d347f0 David Howells                2020-11-18  468  			goto err_clnt;
24e42e32d347f0 David Howells                2020-11-18  469  	}
60e78d2c993e58 Abhishek Kulkarni            2009-09-23  470  #endif
412a19b64ad17f Tejun Heo                    2015-06-08  471  	spin_lock(&v9fs_sessionlist_lock);
412a19b64ad17f Tejun Heo                    2015-06-08  472  	list_add(&v9ses->slist, &v9fs_sessionlist);
412a19b64ad17f Tejun Heo                    2015-06-08  473  	spin_unlock(&v9fs_sessionlist_lock);
60e78d2c993e58 Abhishek Kulkarni            2009-09-23  474  
bd238fb431f319 Latchesar Ionkov             2007-07-10  475  	return fid;
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  476  
412a19b64ad17f Tejun Heo                    2015-06-08  477  err_clnt:
a25c36577ca788 Chengguang Xu                2018-04-05  478  #ifdef CONFIG_9P_FSCACHE
a25c36577ca788 Chengguang Xu                2018-04-05  479  	kfree(v9ses->cachetag);
a25c36577ca788 Chengguang Xu                2018-04-05  480  #endif
412a19b64ad17f Tejun Heo                    2015-06-08  481  	p9_client_destroy(v9ses->clnt);
412a19b64ad17f Tejun Heo                    2015-06-08  482  err_names:
412a19b64ad17f Tejun Heo                    2015-06-08  483  	kfree(v9ses->uname);
412a19b64ad17f Tejun Heo                    2015-06-08  484  	kfree(v9ses->aname);
412a19b64ad17f Tejun Heo                    2015-06-08  485  	return ERR_PTR(rc);
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  486  }
9e82cf6a802a72 Eric Van Hensbergen          2005-09-09  487  

:::::: The code at line 466 was first introduced by commit
:::::: 24e42e32d347f0787a6f99aeb590f3aaa7221093 9p: Use fscache indexing rewrite and reenable caching

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
