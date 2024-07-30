Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA2B2563
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722321749; cv=none; b=ZnqoUL4M1Ibi6XOFGeqScc+OYF5qkHmuLisSpLa7D13Apv6T/N5t9YAxhYuecbyF58DmkKJtXVY0L7vok4WfTCyq8Bcc6rI/Hmb8g3xm61AWXwMs3jQ2np3QnCLr9SN8cVGtoC8iC2zfn0aw29b0+A7nausH/W26dhCjMgvvJ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722321749; c=relaxed/simple;
	bh=GGmWfWRRmTF1AQ2480tNoTncKIH1WHpD+/KJ6wZ1hhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TrI50YmVc1vLMHMikm3NlrOFFw7TErYVhsnE6Vj/403/K5PO50FoS7gzOWFsu6Tdg7maRb3oFayXOO633JkmvD1KhKTK4m4zrdzo5Fz0gKCXNON3yIYyJfR4YH8WNo+K5L7mG4wGPcBV5Y2n4qEWU6iPeEWDNnZZR9aoql90Wkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAQij4so; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAQij4so"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722321747; x=1753857747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GGmWfWRRmTF1AQ2480tNoTncKIH1WHpD+/KJ6wZ1hhg=;
  b=aAQij4so1913UJ9V7Bv/hp89ZwxCPJeiOxlpiUQYS5DP+uQ/q1lhln1F
   Ah1rTFsVRYg7D09pePzpj6RtjuBuOpaBYauTqb4FdyENWimimSLrVXVGe
   69uo2zcK4p3IOxwUEczL48Y11CjkZSult89QL9stBjRsaYhVqBXcIzS0l
   ny2k8ndSf79r1fu16zBz+GWHN7UAG8B6EijwLOxswJGiDNY2cTdiCugLJ
   m2Ft3linf22nvpXGLTLR7GHCwjH0U90LJ3uaXFy1yl1W9f53CiWAjl7Tz
   4ZKtzlcZJ8gSz/GvCF63GLcorduiFe/+InNmy+MP9fn0OP1YwdWVGqp3C
   w==;
X-CSE-ConnectionGUID: 5m8EzdiNTPS3dzAv8bY9XQ==
X-CSE-MsgGUID: lOFGuUW9QmWl6LZYMmXRag==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23034533"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="23034533"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 23:42:26 -0700
X-CSE-ConnectionGUID: Y3vPwcpkQ+mkNYQY4cubkA==
X-CSE-MsgGUID: XFhb5QxVTsOO0kShpIZwoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="53941620"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2024 23:42:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYgYw-000sZE-2q;
	Tue, 30 Jul 2024 06:42:22 +0000
Date: Tue, 30 Jul 2024 14:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 20/25] drivers/fwctl/main.c:111:2-3: Unneeded
 semicolon
Message-ID: <202407301426.J2I6DJgs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   086f159b23ebe3ce8da6439496e3ce31c894932f
commit: 9cc92ee86cf2116d45c2dc07bdc6fbd632191823 [20/25] fwctl: FWCTL_RPC to execute a Remote Procedure Call to device firmware
config: alpha-randconfig-r063-20240730 (https://download.01.org/0day-ci/archive/20240730/202407301426.J2I6DJgs-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301426.J2I6DJgs-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/fwctl/main.c:111:2-3: Unneeded semicolon

vim +111 drivers/fwctl/main.c

    81	
    82	static int fwctl_cmd_rpc(struct fwctl_ucmd *ucmd)
    83	{
    84		struct fwctl_device *fwctl = ucmd->uctx->fwctl;
    85		struct fwctl_rpc *cmd = ucmd->cmd;
    86		size_t out_len;
    87	
    88		if (cmd->in_len > MAX_RPC_LEN || cmd->out_len > MAX_RPC_LEN)
    89			return -EMSGSIZE;
    90	
    91		switch (cmd->scope) {
    92		case FWCTL_RPC_CONFIGURATION:
    93		case FWCTL_RPC_DEBUG_READ_ONLY:
    94			break;
    95	
    96		case FWCTL_RPC_DEBUG_WRITE_FULL:
    97			if (!capable(CAP_SYS_RAWIO))
    98				return -EPERM;
    99			fallthrough;
   100		case FWCTL_RPC_DEBUG_WRITE:
   101			if (!test_and_set_bit(0, &fwctl_tainted)) {
   102				dev_warn(
   103					&fwctl->dev,
   104					"%s(%d): has requested full access to the physical device device",
   105					current->comm, task_pid_nr(current));
   106				add_taint(TAINT_FWCTL, LOCKDEP_STILL_OK);
   107			}
   108			break;
   109		default:
   110			return -EOPNOTSUPP;
 > 111		};
   112	
   113		void *inbuf __free(kvfree) =
   114			kvzalloc(cmd->in_len, GFP_KERNEL | GFP_KERNEL_ACCOUNT);
   115		if (!inbuf)
   116			return -ENOMEM;
   117		if (copy_from_user(inbuf, u64_to_user_ptr(cmd->in), cmd->in_len))
   118			return -EFAULT;
   119	
   120		out_len = cmd->out_len;
   121		void *outbuf __free(kvfree_errptr) = fwctl->ops->fw_rpc(
   122			ucmd->uctx, cmd->scope, inbuf, cmd->in_len, &out_len);
   123		if (IS_ERR(outbuf))
   124			return PTR_ERR(outbuf);
   125		if (outbuf == inbuf) {
   126			/* The driver can re-use inbuf as outbuf */
   127			inbuf = NULL;
   128		}
   129	
   130		if (copy_to_user(u64_to_user_ptr(cmd->out), outbuf,
   131				 min(cmd->out_len, out_len)))
   132			return -EFAULT;
   133	
   134		cmd->out_len = out_len;
   135		return ucmd_respond(ucmd, sizeof(*cmd));
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
