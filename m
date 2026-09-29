Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6399C41A91C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 06:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662369; cv=none; b=hqCtrmUwhmRwFE+FlEH7SX/OaPYnrEh7Dq+cimSMCGnJimXb+dub5WcpmWdfyOkh7ZbDxOhF6vz3/ywF8ukKX0ILt3BC/jLkurWStviCr767XFN59tQJmMflt9IooDKI0LM4dZNHbY+K6NesoG+pX9C42UUS7MCPB+fozXEdPeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662369; c=relaxed/simple;
	bh=G9lae3Lsn5+0FCEPnjOl/ccfareAgNkGhwXDSlmUW4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+ReNSlrgpAtrdSmcHtAhnx4YLsvVIG6EhkaOP76WH8+zwHbMcsTUv/DfgyuefH6oKOsO2gN37bnbqo7m+WEWdNH7nwwtAW/cmA5oNRFsPqH/t9xs7B6PKq0IOiYi+nn5to1OzSfvVqkzwsoeRa5+NQLnT4NQXSUVo3dQDbrGys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtDIjbbS; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtDIjbbS"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so1367637f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 23:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662365; x=1791267165; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tt6PGN3qkJIsSLHEq6Gnh7+ySkg0p88BmXoSV+4rvhU=;
        b=mtDIjbbS0Zyyti2WmXVrG+Pjijx3OUifbT1NGC6m8cdkS1BE46eFxFPIVPUqdgV+zf
         rlZs6eaaZ4Zj2T3iZgfPqULt+ad4CboGxBH1kOSopWlTuJwKpJj7M4FZefU2bwXnpDm0
         dqwV1fJPUDNQ6x5XhxcgDR9xfZo3rrCXVmOxP2lSyshkEj1i8B4W4MQXyxXOxAnCASYN
         HNvRZyZX+VAEkpHi+Fj0fmNTYyBLAQ/CskImdYKT6rDW4JTojPi1W6yaGM9rUErPlIk6
         ftX6t11FXKCyiqTlr1f69Q358NHhhicL3QxfS7KY1rezK7dF0nuUaUpoyOL7gzTJcgz1
         xAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662365; x=1791267165;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tt6PGN3qkJIsSLHEq6Gnh7+ySkg0p88BmXoSV+4rvhU=;
        b=ilsRvZEekT+d53PxMdX9qwkOxrdh69aNOL/d1xURbz9nVHI2ICD1apTkMXbQn3oV/5
         8vBrLKw6zeglTE6wfu2nYR0/MbLDA1aO7lnMuXRXUrvly6rfQqngRWoV+eJVhxchtv2J
         zH71BcZIBkioYBA8USN0vyyHmb6dCpzv75/Zh8X+Qb+2FvV/5FTagOvBjbHPmZlMUltz
         4gSzfeazwVfE0B6Ycues3M00FI5Qe7IxxIbeLxQew/1Oc3ZEVKaZmN1PcjHPYkfJID/L
         xNtywyUoydSuBwXauWK9EG6f85YRIiESGqPui4R90VZUP3956grp4LEYS3E6ljY6+JjA
         pboQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiljsXAHHdz1UVeIYs+Y1kWTaN3MopvZIaqF6dLVnp/FodJNWDWypKP957TjYhDN0ncErLbK4tcZPemlff@lists.linux.dev
X-Gm-Message-State: AFq9FYK3l64i+LSGhG3foP0psmyO+NaCJXa46QAouPoYlh5xDQHTe8CR
	xuyOMM9BfNn/BalBT3RJeFfE8tsb7R3GoNluF73RAOvSHqsPdmZRQnbb
X-Gm-Gg: AYBFou2HDQvKVNTJFmVn8hq3fNS2sBP39jpJsp95YLHHzNkoYkghaFXwXsE9OLDvUcd
	MHW8ROddGaAuAv+0DtOmmxwbKMNGqFV2tMdQSVYQFyqypkckoaUgbSdw75iOx+Pfc22bnD7AO3d
	CZ4FEGF04bILdZxUo7No0dimq74aT22IcKf1iOgLTR33WJDEmZ6P+/vRJXOdpT4x9nxJAorXXgT
	gd9Zh7BqX7EBUzM9uYSy6JRXw804owXI2aexa6KPMqw0nogLBOuOUVnk24LHf79FIU7PCPbbTVt
	FvkdErhlCRKBQcV6n88/PNxQuBAExlTdc7xcNF/ZKZkDkF48MnIofvxNkMA6xkYqKk1aZ0ny70k
	kmAIPRPDJR50B9qjtfTqEKNTnA5I3mwT+qZy8xQQs+fzmcLR3urzZVlfccnchzT9cdppFOExvXv
	QxZbAyeS7+dMkPGeuD+FslQGvw13+uJ1rxW7bEvM6Zaq3fEctPELpFEsTKZZ+MECb+mvo=
X-Received: by 2002:a5d:5d04:0:b0:487:146f:7c88 with SMTP id ffacd0b85a97d-48af1a8f1afmr2366650f8f.4.1790662365144;
        Mon, 28 Sep 2026 23:12:45 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50923f0sm1298428f8f.31.2026.09.28.23.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:44 -0700 (PDT)
Date: Tue, 29 Sep 2026 09:12:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 7/7]
 kernel/cgroup/cgroup.c:5863 cgroup_create() warn: passing zero to 'ERR_PTR'
Message-ID: <202609290742.QWPr7C7s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   46c9dcf34122090162fe8bdaf2c9f5c17fc95448
commit: caeb52b32bd70bc82167f136ab287e2b7a916375 [7/7] ANDROID: cgroup: Use backport reservation for freeze time
config: x86_64-randconfig-2200-20260929 (https://download.01.org/0day-ci/archive/20260929/202609290742.QWPr7C7s-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609290742.QWPr7C7s-lkp@intel.com/

smatch warnings:
kernel/cgroup/cgroup.c:5863 cgroup_create() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +5863 kernel/cgroup/cgroup.c

743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5741  static struct cgroup *cgroup_create(struct cgroup *parent, const char *name,
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5742  				    umode_t mode)
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5743  {
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5744  	struct cgroup_root *root = parent->root;
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5745  	struct cgroup *cgrp, *tcgrp;
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5746  	struct kernfs_node *kn;
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5747  	int level = parent->level + 1;
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5748  	int ret;
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5749  
0a950f65e1e64f kernel/cgroup.c        Tejun Heo          2012-11-19  5750  	/* allocate the cgroup and its ID, 0 is reserved for the root */
7f203bc89eb66d kernel/cgroup/cgroup.c Tejun Heo          2022-07-29  5751  	cgrp = kzalloc(struct_size(cgrp, ancestors, (level + 1)), GFP_KERNEL);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5752  	if (!cgrp)
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5753  		return ERR_PTR(-ENOMEM);
0ab02ca8f88790 kernel/cgroup.c        Li Zefan           2014-02-11  5754  
2aad2a86f6685c kernel/cgroup.c        Tejun Heo          2014-09-24  5755  	ret = percpu_ref_init(&cgrp->self.refcnt, css_release, 0, GFP_KERNEL);
9d755d33f0db8c kernel/cgroup.c        Tejun Heo          2014-05-14  5756  	if (ret)
9d755d33f0db8c kernel/cgroup.c        Tejun Heo          2014-05-14  5757  		goto out_free_cgrp;
9d755d33f0db8c kernel/cgroup.c        Tejun Heo          2014-05-14  5758  
c58632b3631cb2 kernel/cgroup/cgroup.c Tejun Heo          2018-04-26  5759  	ret = cgroup_rstat_init(cgrp);
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5760  	if (ret)
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5761  		goto out_cancel_ref;
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5762  
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5763  	/* create the directory */
fe3de0102bc830 kernel/cgroup/cgroup.c Max Kellermann     2023-12-08  5764  	kn = kernfs_create_dir_ns(parent->kn, name, mode,
fe3de0102bc830 kernel/cgroup/cgroup.c Max Kellermann     2023-12-08  5765  				  current_fsuid(), current_fsgid(),
fe3de0102bc830 kernel/cgroup/cgroup.c Max Kellermann     2023-12-08  5766  				  cgrp, NULL);
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5767  	if (IS_ERR(kn)) {
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5768  		ret = PTR_ERR(kn);
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5769  		goto out_stat_exit;
976c06bcccc505 kernel/cgroup.c        Tejun Heo          2012-11-05  5770  	}
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5771  	cgrp->kn = kn;
976c06bcccc505 kernel/cgroup.c        Tejun Heo          2012-11-05  5772  
cc31edceee04a7 kernel/cgroup.c        Paul Menage        2008-10-18  5773  	init_cgroup_housekeeping(cgrp);
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5774  
9d800df12d3173 kernel/cgroup.c        Tejun Heo          2014-05-14  5775  	cgrp->self.parent = &parent->self;
ba0f4d761503bd kernel/cgroup.c        Tejun Heo          2014-05-13  5776  	cgrp->root = root;
b11cfb5807e303 kernel/cgroup.c        Tejun Heo          2015-11-20  5777  	cgrp->level = level;
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5778  
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5779  	ret = psi_cgroup_alloc(cgrp);
324bda9e6c5add kernel/cgroup/cgroup.c Alexei Starovoitov 2017-10-02  5780  	if (ret)
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5781  		goto out_kernfs_remove;
b11cfb5807e303 kernel/cgroup.c        Tejun Heo          2015-11-20  5782  
f390525e496920 kernel/cgroup/cgroup.c Chen Ridong        2024-10-18  5783  	if (cgrp->root == &cgrp_dfl_root) {
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5784  		ret = cgroup_bpf_inherit(cgrp);
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5785  		if (ret)
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5786  			goto out_psi_free;
f390525e496920 kernel/cgroup/cgroup.c Chen Ridong        2024-10-18  5787  	}
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5788  
caeb52b32bd70b kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5789  	cgrp->kmi_ext_info = kzalloc(sizeof(*cgrp->kmi_ext_info), GFP_KERNEL);
caeb52b32bd70b kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5790  	if (!cgrp->kmi_ext_info)
caeb52b32bd70b kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5791  		goto out_psi_free;

ret = -ENOMEM;

caeb52b32bd70b kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5792  
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5793  	/*
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5794  	 * New cgroup inherits effective freeze counter, and
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5795  	 * if the parent has to be frozen, the child has too.
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5796  	 */
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5797  	cgrp->freezer.e_freeze = parent->freezer.e_freeze;
caeb52b32bd70b kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5798  	seqcount_init(&cgrp->kmi_ext_info->freezer.freeze_seq);
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5799  	if (cgrp->freezer.e_freeze) {
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5800  		/*
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5801  		 * Set the CGRP_FREEZE flag, so when a process will be
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5802  		 * attached to the child cgroup, it will become frozen.
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5803  		 * At this point the new cgroup is unpopulated, so we can
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5804  		 * consider it frozen immediately.
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5805  		 */
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5806  		set_bit(CGRP_FREEZE, &cgrp->flags);
caeb52b32bd70b kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5807  		cgrp->kmi_ext_info->freezer.freeze_start_nsec = ktime_get_ns();
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5808  		set_bit(CGRP_FROZEN, &cgrp->flags);
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5809  	}
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5810  
4dcabece4c3a9f kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5811  	spin_lock_irq(&css_set_lock);
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5812  	for (tcgrp = cgrp; tcgrp; tcgrp = cgroup_parent(tcgrp)) {
7f203bc89eb66d kernel/cgroup/cgroup.c Tejun Heo          2022-07-29  5813  		cgrp->ancestors[tcgrp->level] = tcgrp;
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5814  
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5815  		if (tcgrp != cgrp) {
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5816  			tcgrp->nr_descendants++;
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5817  
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5818  			/*
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5819  			 * If the new cgroup is frozen, all ancestor cgroups
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5820  			 * get a new frozen descendant, but their state can't
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5821  			 * change because of this.
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5822  			 */
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5823  			if (cgrp->freezer.e_freeze)
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5824  				tcgrp->freezer.nr_frozen_descendants++;
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5825  		}
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5826  	}
4dcabece4c3a9f kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5827  	spin_unlock_irq(&css_set_lock);
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5828  
b6abdb0e6ca5c2 kernel/cgroup.c        Li Zefan           2008-03-04  5829  	if (notify_on_release(parent))
b6abdb0e6ca5c2 kernel/cgroup.c        Li Zefan           2008-03-04  5830  		set_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
b6abdb0e6ca5c2 kernel/cgroup.c        Li Zefan           2008-03-04  5831  
2260e7fc1f18ad kernel/cgroup.c        Tejun Heo          2012-11-19  5832  	if (test_bit(CGRP_CPUSET_CLONE_CHILDREN, &parent->flags))
2260e7fc1f18ad kernel/cgroup.c        Tejun Heo          2012-11-19  5833  		set_bit(CGRP_CPUSET_CLONE_CHILDREN, &cgrp->flags);
97978e6d1f2da0 kernel/cgroup.c        Daniel Lezcano     2010-10-27  5834  
0cb51d71c1fa92 kernel/cgroup.c        Tejun Heo          2014-05-16  5835  	cgrp->self.serial_nr = css_serial_nr_next++;
53fa5261747a90 kernel/cgroup.c        Tejun Heo          2013-05-24  5836  
4e139afc22cb98 kernel/cgroup.c        Tejun Heo          2012-11-19  5837  	/* allocation complete, commit to creation */
d5c419b68e368f kernel/cgroup.c        Tejun Heo          2014-05-16  5838  	list_add_tail_rcu(&cgrp->self.sibling, &cgroup_parent(cgrp)->self.children);
3c9c825b8b50de kernel/cgroup.c        Tejun Heo          2014-02-12  5839  	atomic_inc(&root->nr_cgrps);
a590b90d472f2c kernel/cgroup/cgroup.c Tejun Heo          2017-04-28  5840  	cgroup_get_live(parent);
415cf07a1c1c65 kernel/cgroup.c        Li Zefan           2013-04-08  5841  
bd53d617b34c78 kernel/cgroup.c        Tejun Heo          2014-04-23  5842  	/*
bd53d617b34c78 kernel/cgroup.c        Tejun Heo          2014-04-23  5843  	 * On the default hierarchy, a child doesn't automatically inherit
667c24917144e3 kernel/cgroup.c        Tejun Heo          2014-07-08  5844  	 * subtree_control from the parent.  Each is configured manually.
bd53d617b34c78 kernel/cgroup.c        Tejun Heo          2014-04-23  5845  	 */
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5846  	if (!cgroup_on_dfl(cgrp))
5531dc915ba10b kernel/cgroup.c        Tejun Heo          2016-03-03  5847  		cgrp->subtree_control = cgroup_control(cgrp);
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5848  
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5849  	cgroup_propagate_control(cgrp);
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5850  
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5851  	return cgrp;
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5852  
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5853  out_psi_free:
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5854  	psi_cgroup_free(cgrp);
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5855  out_kernfs_remove:
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5856  	kernfs_remove(cgrp->kn);
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5857  out_stat_exit:
c58632b3631cb2 kernel/cgroup/cgroup.c Tejun Heo          2018-04-26  5858  	cgroup_rstat_exit(cgrp);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5859  out_cancel_ref:
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5860  	percpu_ref_exit(&cgrp->self.refcnt);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5861  out_free_cgrp:
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5862  	kfree(cgrp);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03 @5863  	return ERR_PTR(ret);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5864  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

