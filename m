Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680861FCF72
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 10:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084980; cv=none; b=BT4gpMjhjusA2o1lb10yGzYSCIUmWwwbojphMJiEiCamJmoFB/v+WocTC3/EttygXYL29NNz7kXtQ1zpsMeujsxihwndA2aJCaHQchcbpSaUS/3JKxv8EgP+sVr9JoR20rzDqrcvfi4lHPJetwqlxVspOtihHoHG63OxtouPAPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084980; c=relaxed/simple;
	bh=c3TOkH6uh02rmb5l2+h82PafOh0VyOZdkMSc/8+K4f0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eUBtHQWX3D+KnWOqvimH198cxHJbCOlBcn709UXHdob5AomrVSH75i8DW05XV6NK/l5unXVHBNINCnUrPBqSy+HNV/hT0s3UCKcn3RmI+zFVTNPU83oJs98Nfk+J1QhAcVtQLufhPJT1a/LB7JtVnWnHD1UGuRJD3V4YcxyV7Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oxl/sycy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oxl/sycy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741084978; x=1772620978;
  h=date:from:cc:subject:message-id:mime-version;
  bh=c3TOkH6uh02rmb5l2+h82PafOh0VyOZdkMSc/8+K4f0=;
  b=Oxl/sycyhCNHo9FuEl7QitfLiWdUWv9eIVqAZqsoMkTpC59mjPHLPN+7
   Sj2czIIz1xHdnyM3w3fEaSw69Fp/lAdXXjJ882MP62xosvY+o8akE+O8r
   5krDh0q3cyRRdksrQ+JCu0iGEqBi8C7BdP2OWqVbRacaEQTw938Mwuwz8
   MYNJdQdqOcwie8t1pL4GLUinpNac/T+krUg1A+FMlXR854BxiklkJjyWL
   +UeJMpfMU0TlWFi/jRfoa3als/MOx3kpA6pSYEfEVck/q9nbf/S1+hKdH
   Dghq17OJmncXh9KCefzgufwqfUOZJsjuWOhpaAe7SQR6AYo6eziVx5kuQ
   w==;
X-CSE-ConnectionGUID: GlmoOOUeSXy+tFRHMQQUZg==
X-CSE-MsgGUID: usr7QbUORgWh9MF7Af9eOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53390792"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="53390792"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 02:42:57 -0800
X-CSE-ConnectionGUID: ttOvi9R7Swi558D9eBbZuQ==
X-CSE-MsgGUID: sGeRI5zSSEaZfhUkdu5zlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="119028093"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Mar 2025 02:42:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpPjh-000JcQ-2H
	for oe-kbuild-all@lists.linux.dev;
	Tue, 04 Mar 2025 10:42:53 +0000
Date: Tue, 4 Mar 2025 18:42:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] fs/cifs/smb2ops.c:1826: Error: unrecognized
 opcode `csrs sstatus,a3', extension `zicsr' required
Message-ID: <202503041857.mHsL0fyU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 153322f7536a181e4d1b288aa6f01c0ce65f5c7c [1/1] smb3: Fix enumerating snapshots to Azure
config: riscv-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250304/202503041857.mHsL0fyU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503041857.mHsL0fyU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503041857.mHsL0fyU-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/cifs/smb2ops.c: In function 'smb3_punch_hole':
   fs/cifs/smb2ops.c:2727:31: warning: variable 'cifsi' set but not used [-Wunused-but-set-variable]
    2727 |         struct cifsInodeInfo *cifsi;
         |                               ^~~~~
   fs/cifs/smb2ops.c: Assembler messages:
>> fs/cifs/smb2ops.c:1826: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
>> fs/cifs/smb2ops.c:1826: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required


vim +1826 fs/cifs/smb2ops.c

  1811	
  1812	/*
  1813	 * Input buffer contains (empty) struct smb_snapshot array with size filled in
  1814	 * For output see struct SRV_SNAPSHOT_ARRAY in MS-SMB2 section 2.2.32.2
  1815	 */
  1816	static int
  1817	smb3_enum_snapshots(const unsigned int xid, struct cifs_tcon *tcon,
  1818			   struct cifsFileInfo *cfile, void __user *ioc_buf)
  1819	{
  1820		char *retbuf = NULL;
  1821		unsigned int ret_data_len = 0;
  1822		int rc;
  1823		u32 max_response_size;
  1824		struct smb_snapshot_array snapshot_in;
  1825	
> 1826		if (get_user(ret_data_len, (unsigned int __user *)ioc_buf))
  1827			return -EFAULT;
  1828	
  1829		/*
  1830		 * Note that for snapshot queries that servers like Azure expect that
  1831		 * the first query be minimal size (and just used to get the number/size
  1832		 * of previous versions) so response size must be specified as EXACTLY
  1833		 * sizeof(struct snapshot_array) which is 16 when rounded up to multiple
  1834		 * of eight bytes.
  1835		 */
  1836		if (ret_data_len == 0)
  1837			max_response_size = MIN_SNAPSHOT_ARRAY_SIZE;
  1838		else
  1839			max_response_size = CIFSMaxBufSize;
  1840	
  1841		rc = SMB2_ioctl(xid, tcon, cfile->fid.persistent_fid,
  1842				cfile->fid.volatile_fid,
  1843				FSCTL_SRV_ENUMERATE_SNAPSHOTS,
  1844				true /* is_fsctl */,
  1845				NULL, 0 /* no input data */, max_response_size,
  1846				(char **)&retbuf,
  1847				&ret_data_len);
  1848		cifs_dbg(FYI, "enum snaphots ioctl returned %d and ret buflen is %d\n",
  1849				rc, ret_data_len);
  1850		if (rc)
  1851			return rc;
  1852	
  1853		if (ret_data_len && (ioc_buf != NULL) && (retbuf != NULL)) {
  1854			/* Fixup buffer */
  1855			if (copy_from_user(&snapshot_in, ioc_buf,
  1856			    sizeof(struct smb_snapshot_array))) {
  1857				rc = -EFAULT;
  1858				kfree(retbuf);
  1859				return rc;
  1860			}
  1861	
  1862			/*
  1863			 * Check for min size, ie not large enough to fit even one GMT
  1864			 * token (snapshot).  On the first ioctl some users may pass in
  1865			 * smaller size (or zero) to simply get the size of the array
  1866			 * so the user space caller can allocate sufficient memory
  1867			 * and retry the ioctl again with larger array size sufficient
  1868			 * to hold all of the snapshot GMT tokens on the second try.
  1869			 */
  1870			if (snapshot_in.snapshot_array_size < GMT_TOKEN_SIZE)
  1871				ret_data_len = sizeof(struct smb_snapshot_array);
  1872	
  1873			/*
  1874			 * We return struct SRV_SNAPSHOT_ARRAY, followed by
  1875			 * the snapshot array (of 50 byte GMT tokens) each
  1876			 * representing an available previous version of the data
  1877			 */
  1878			if (ret_data_len > (snapshot_in.snapshot_array_size +
  1879						sizeof(struct smb_snapshot_array)))
  1880				ret_data_len = snapshot_in.snapshot_array_size +
  1881						sizeof(struct smb_snapshot_array);
  1882	
  1883			if (copy_to_user(ioc_buf, retbuf, ret_data_len))
  1884				rc = -EFAULT;
  1885		}
  1886	
  1887		kfree(retbuf);
  1888		return rc;
  1889	}
  1890	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
