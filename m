Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E951227B4E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 22:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750889502; cv=none; b=jn/uIrtpGLW9/UNUTNsa3MWbvk4kFlP691A0vDQBn0NfWlUtc9Bx+aC7SSL2xlcuDkjTYZ6GL3Ki80xV+yYJ+Xw0S7rxzgTrXMT5UhooI3a5PZsTUi2t8WuvAgGWI1XvtjXfClEb/zOkM4IMFKATOsGWIlIlb7UXoyHHrQu9rQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750889502; c=relaxed/simple;
	bh=9MHp0EUXYgZktE5hlIhFD+j11i6IHoUrZRnqJa3Md9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MRgsj5EwuzDmY7l6aXzmDKCXiKCdpaErEJjtUUP9T//gC44JGAxaQ+RZ4HeiT0GkYLQpw5fRRUKMb0niWUBhbCzyi7AHHb+2CNvbn5ktLbePvotWTef+5DGi5mcf8uHD9WAME48dTISZ8nP+YNbcb1Fvh1znXKX3VYT4BcLLsso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpcYncq9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpcYncq9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750889500; x=1782425500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MHp0EUXYgZktE5hlIhFD+j11i6IHoUrZRnqJa3Md9c=;
  b=HpcYncq9UG2baTCET6Rn1uzueVMEQwJIzpDNBywnndjLGYu23guNzzxS
   H1tUwTw88jPEwI8Mh15Hl8mxx4UDf8g7aKqZ40h5B9lAUTWmvRxspY25h
   90W0bN37HylsFfxraIqKjSLFHE3xKOHDXSAlCPC2X7UtnKYBLl1aizoSx
   UdLy0t3ayOKiZX7JHkW39ydyCUtepv3CBJnrnbxTF5sOotqiThRTt7vkZ
   fy/+UHNtCUs0pBbqseQP2YqWW9gI97hgdPC2qedJeasOu42DnvrvWuvFw
   5n6RV3D5EgL05Cjh1SYzjZ/eUPj/HZtNK7f4l21qj2ue6GCJ3d8ADBcvG
   w==;
X-CSE-ConnectionGUID: Q/IJGGEySPejyjGRiu4ZIA==
X-CSE-MsgGUID: Dn0X6bCcSX+OrDiyFSLJjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53270935"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53270935"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 15:11:37 -0700
X-CSE-ConnectionGUID: +27DddziTziMBU7dcceK2Q==
X-CSE-MsgGUID: mY/utMkrTNeAUaxn7hM7SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="175989468"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jun 2025 15:11:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUYL7-000TUM-12;
	Wed, 25 Jun 2025 22:11:33 +0000
Date: Thu, 26 Jun 2025 06:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:smp3 18/18] fs/seq_file.c:1129:36: warning: statement with no
 effect
Message-ID: <202506260604.mbWUxxkl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux smp3
head:   0beaccbbf4cc7a3ecbb1ee89ac6428265f123b20
commit: 0beaccbbf4cc7a3ecbb1ee89ac6428265f123b20 [18/18] seq_file: use a dedicated for_each_cpu() in seq_hlist_next_percpu()
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250626/202506260604.mbWUxxkl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260604.mbWUxxkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260604.mbWUxxkl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from fs/seq_file.c:12:
   fs/seq_file.c: In function 'seq_hlist_next_percpu':
>> fs/seq_file.c:1129:36: warning: statement with no effect [-Wunused-value]
    1129 |         for_each_possible_cpu_from(*cpu)  {
   include/linux/cpumask.h:1117:47: note: in definition of macro 'for_each_possible_cpu_from'
    1117 | #define for_each_possible_cpu_from(cpu) for ((cpu); (cpu) < 1; (cpu)++)
         |                                               ^~~


vim +1129 fs/seq_file.c

  1108	
  1109	/**
  1110	 * seq_hlist_next_percpu - move to the next position of the percpu hlist array
  1111	 * @v:    pointer to current hlist_node
  1112	 * @head: pointer to percpu array of struct hlist_heads
  1113	 * @cpu:  pointer to cpu "cursor"
  1114	 * @pos:  start position of sequence
  1115	 *
  1116	 * Called at seq_file->op->next().
  1117	 */
  1118	struct hlist_node *
  1119	seq_hlist_next_percpu(void *v, struct hlist_head __percpu *head,
  1120				int *cpu, loff_t *pos)
  1121	{
  1122		struct hlist_node *node = v;
  1123	
  1124		++*pos;
  1125	
  1126		if (node->next)
  1127			return node->next;
  1128	
> 1129		for_each_possible_cpu_from(*cpu)  {
  1130			struct hlist_head *bucket = per_cpu_ptr(head, *cpu);
  1131	
  1132			if (!hlist_empty(bucket))
  1133				return bucket->first;
  1134		}
  1135		return NULL;
  1136	}
  1137	EXPORT_SYMBOL(seq_hlist_next_percpu);
  1138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
