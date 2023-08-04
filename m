Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA51AA79
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691171025; x=1722707025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oC/XLWDE0cUVjCrfm5DH9U2J72qWkBfDG3kqn5pux4Y=;
  b=IQSQqBjGZoTu1ffjseh+TWVkCqAxCHmVPs6Oh05fwAuZAXqG6MxltGGg
   1/SjqQJMJXUrRlg/5Fcp5QGENriTNbU2rjrTbHG5w53fLIR3xQwlYqed5
   GZlLqTQEI7xviLiZR7dcLIJJvuAOCPrdWRE+D+QuBkNeJX6T3hsIwjJvg
   ML9pnociRJGoFUiD0W8TpjTjVDTduCA7sp7fubiZ5GUWzZvYk2zibJC2c
   n3g8RgOiZrKPv4Fh4RtQCs6XLiDWe/rR/eYePGeoGwRAMt05wM3AZLVSA
   6GXpFyzYXIArMI4xp/4akrTFmxQWycFYQz0igbiq2LKj11h4UqZ65JQHJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456587129"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="456587129"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 10:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="795489445"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="795489445"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Aug 2023 10:43:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRypy-00031D-32;
	Fri, 04 Aug 2023 17:43:42 +0000
Date: Sat, 5 Aug 2023 01:43:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7] vfs, security: Fix automount superblock LSM init
 problem, preventing NFS sb sharing
Message-ID: <202308050110.6Zheq1P5-lkp@intel.com>
References: <20230804-master-v7-1-5d4e48407298@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804-master-v7-1-5d4e48407298@kernel.org>

Hi Jeff,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/vfs-security-Fix-automount-superblock-LSM-init-problem-preventing-NFS-sb-sharing/20230805-001234
base:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
patch link:    https://lore.kernel.org/r/20230804-master-v7-1-5d4e48407298%40kernel.org
patch subject: [PATCH v7] vfs, security: Fix automount superblock LSM init problem, preventing NFS sb sharing
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230805/202308050110.6Zheq1P5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050110.6Zheq1P5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050110.6Zheq1P5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/smack/smack_lsm.c: In function 'smack_fs_context_init':
>> security/smack/smack_lsm.c:631:66: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     631 |         if (!reference || fc->purpose != FS_CONTEXT_FOR_SUBMOUNT);
         |                                                                  ^
>> security/smack/smack_lsm.c:631:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     631 |         if (!reference || fc->purpose != FS_CONTEXT_FOR_SUBMOUNT);
         |         ^~
   security/smack/smack_lsm.c:632:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     632 |                 return 0;
         |                 ^~~~~~


vim +/if +631 security/smack/smack_lsm.c

   616	
   617	/**
   618	 * smack_fs_context_init - Initialise security data for a filesystem context
   619	 * @fc: The filesystem context.
   620	 * @reference: Reference dentry (automount/reconfigure) or NULL
   621	 *
   622	 * Returns 0 on success or -ENOMEM on error.
   623	 */
   624	static int smack_fs_context_init(struct fs_context *fc,
   625					 struct dentry *reference)
   626	{
   627		struct superblock_smack *sbsp;
   628		struct smack_mnt_opts *ctx;
   629		struct inode_smack *isp;
   630	
 > 631		if (!reference || fc->purpose != FS_CONTEXT_FOR_SUBMOUNT);
   632			return 0;
   633	
   634		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
   635		if (!ctx)
   636			return -ENOMEM;
   637		fc->security = ctx;
   638	
   639		sbsp = smack_superblock(reference->d_sb);
   640		isp = smack_inode(reference->d_sb->s_root->d_inode);
   641	
   642		if (sbsp->smk_default) {
   643			ctx->fsdefault = kstrdup(sbsp->smk_default->smk_known, GFP_KERNEL);
   644			if (!ctx->fsdefault)
   645				return -ENOMEM;
   646		}
   647	
   648		if (sbsp->smk_floor) {
   649			ctx->fsfloor = kstrdup(sbsp->smk_floor->smk_known, GFP_KERNEL);
   650			if (!ctx->fsfloor)
   651				return -ENOMEM;
   652		}
   653	
   654		if (sbsp->smk_hat) {
   655			ctx->fshat = kstrdup(sbsp->smk_hat->smk_known, GFP_KERNEL);
   656			if (!ctx->fshat)
   657				return -ENOMEM;
   658		}
   659	
   660		if (isp->smk_flags & SMK_INODE_TRANSMUTE) {
   661			if (sbsp->smk_root) {
   662				ctx->fstransmute = kstrdup(sbsp->smk_root->smk_known, GFP_KERNEL);
   663				if (!ctx->fstransmute)
   664					return -ENOMEM;
   665			}
   666		}
   667		return 0;
   668	}
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
