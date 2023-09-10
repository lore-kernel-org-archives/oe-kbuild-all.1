Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A7510E9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 00:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694307307; x=1725843307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bvf2aoCZhu+qm01hoQ6MuqydZx6l6R8msqM8FDCJgIY=;
  b=fNHLl3hvoX4Zpg9k7U01dzjsACNE83NEMZLmZzP1FsUNuBzcZ3u78rpI
   CC2IoIGSZDI4u5oEeP+NPG8vAF/pazPQd3c+dz2GVl/tbQYhlq6MKZcPj
   tnZl8BtcotmzcAutGlLEZFyJQ4NLyL2uo9lfwQLlrnL533gHBfdxQ7Qws
   1ZpfXP+pXhvhiupxTHGtf+Zr3gsJrPhmFMxP/OVfjUpD7D6a5x5y0CT+s
   0tTOpUE1KrkbTgalQ7ZeAiwtxHNreyyESCl5ix/JIafxY/t8lTamARRXU
   tlPBiJH92lAPqF2fdpjY4l2SQTKAo9+Ia26gtrigZpf5qLJJnrAnfj4zX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441871550"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="441871550"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 17:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="772142177"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="772142177"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Sep 2023 17:55:04 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf8j7-00047G-30;
	Sun, 10 Sep 2023 00:55:01 +0000
Date: Sun, 10 Sep 2023 08:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/3] fs/fuse/backing.c:1218:
 undefined reference to `fuse_get_bpf_prog'
Message-ID: <202309100803.ZojB6Bgv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d4f95b543e9e58a9ca8a5c5825ccb30767afe211
commit: f5f4199c102aa676998b42abff60d071385c1c0c [1/3] ANDROID: fuse-bpf v1.1
config: i386-randconfig-054-20230910 (https://download.01.org/0day-ci/archive/20230910/202309100803.ZojB6Bgv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100803.ZojB6Bgv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100803.ZojB6Bgv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/fuse/backing.o: in function `fuse_handle_bpf_prog':
>> fs/fuse/backing.c:1218: undefined reference to `fuse_get_bpf_prog'


vim +1218 fs/fuse/backing.c

  1186	
  1187	int fuse_handle_bpf_prog(struct fuse_entry_bpf *feb, struct inode *parent,
  1188				 struct bpf_prog **bpf)
  1189	{
  1190		struct fuse_inode *pi;
  1191	
  1192		// Parent isn't presented, but we want to keep
  1193		// Don't touch bpf program at all in this case
  1194		if (feb->out.bpf_action == FUSE_ACTION_KEEP && !parent)
  1195			goto out;
  1196	
  1197		if (*bpf) {
  1198			bpf_prog_put(*bpf);
  1199			*bpf = NULL;
  1200		}
  1201	
  1202		switch (feb->out.bpf_action) {
  1203		case FUSE_ACTION_KEEP:
  1204			pi = get_fuse_inode(parent);
  1205			*bpf = pi->bpf;
  1206			if (*bpf)
  1207				bpf_prog_inc(*bpf);
  1208			break;
  1209	
  1210		case FUSE_ACTION_REMOVE:
  1211			break;
  1212	
  1213		case FUSE_ACTION_REPLACE: {
  1214			struct file *bpf_file = feb->bpf_file;
  1215			struct bpf_prog *bpf_prog = ERR_PTR(-EINVAL);
  1216	
  1217			if (bpf_file && !IS_ERR(bpf_file))
> 1218				bpf_prog = fuse_get_bpf_prog(bpf_file);
  1219	
  1220			if (IS_ERR(bpf_prog))
  1221				return PTR_ERR(bpf_prog);
  1222	
  1223			*bpf = bpf_prog;
  1224			break;
  1225		}
  1226	
  1227		default:
  1228			return -EINVAL;
  1229		}
  1230	
  1231	out:
  1232		return 0;
  1233	}
  1234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
