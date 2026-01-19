Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9394B2367D3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768802895; cv=none; b=Uc6rAQfZLb8a5q6590EarUfH57xupzYATHj/ohNdjQ+Ajti5Dlp8EN14aWotx9aBYqOIU9JiTqP150SyQsOpRkb9W6lGa0WnWEfcsmDq7bQy4b4jn5g1htGmvaUCjaeEg6zQdKMwA56nDAG1l8ttvt09LA1eSmSIslPlZ3pA52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768802895; c=relaxed/simple;
	bh=vWUkjhfUbEZV7kbuNElxJNOud06EaHxa2Iy/yDSm7tA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N6RsWO1fxAfI7OteMtdCUlzDSrgZVI55JAf7sQhyjGZ9n9P/qAK62FOVv7L/5BovcN/FJkzU+zRot3QSiV21rmKMQ5u4JV40K+gOSrjQdqFvOzMY+bJmWilHyofTMwoUK0PzTa2aOnVbW6XB2D8vxCRK81MZ8gMGdMi/PxRMiEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qv26y733; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qv26y733"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-432d2c96215so3179602f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 22:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768802892; x=1769407692; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1yxcReL8kFJC6k/l9GleMlbmHFN9j2jG+BWWzV3nfHU=;
        b=Qv26y733FvzjFPPmsHyZ4ke+owPmbW6LoM5CCrRex0NdtvK/1aDO7xV15AAlKfMF3/
         EpsRaNhDiUmjc3BZaovezpq6mjb8CD5OgYRUpYX+ktHeBpY92r0u3DdeRNY8TB+VD+HT
         rOVBkZL4A2lkDaRlGZz4zc7LuUyactMOXcX1H/Se8okMqQ7zeZI2HarA7ZX6oOOEomMT
         SH7G6MAjCQFvG4HU0o0YujfNxJvBS7/70Zex16tZr0jkP2O0vfN8lQzKhVP2z9FL5v2I
         Rzp9RKkLsnMkJtSK2rD4imNPCD/6RmqV4OtAHp8+xcLXuAKjwGw1o4HrPVAPHIqaB/Wd
         fQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768802892; x=1769407692;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yxcReL8kFJC6k/l9GleMlbmHFN9j2jG+BWWzV3nfHU=;
        b=e7Uj6Xf0JsyRGs/cbOhGkNWHVj/hBcMbqnToQSCHFFQI++riBTjaeo18Mip0/FgtqY
         VR3MLTPXWEapRlySzrNpUXzU9ntzaYrfNiuGnNs0LfrJS99nvcs4Ms4l/IGmhn3F6RVd
         Txy6t0ISbVDUlRJl5/rohrOJNQ75ngbl2hLGG1C+Lfg2/1yt2Jq5jz8WQ6j0YQV201TD
         qp7yPRxnfHMX7TkZuykLX00P4vkUHt6nhWNNNtqYz2zlrNUP5YfB5WAIiKDdRSsFCKD5
         XeI43PtclOT4CvWqbJ+vUjA1A/RlLIh7xE6TtBTRa3PFEkSHL2QaNNSJqEOWxZsDMwdW
         n9bw==
X-Forwarded-Encrypted: i=1; AJvYcCXz9S0i+jH/FFdlzxWhtlW7Km27wX/5q8yZ4W7D8Pn0rQ6WSIS+NFm14/ijXFCCtS7+LdRIKd4YAgN1FCVD@lists.linux.dev
X-Gm-Message-State: AOJu0YwTV8woxzgv5UvS+F87aX1R/R8/VZafr6rPIKrlEjlDuKS1bszj
	KfUd+0u7uRnZQVzb9qsytMS9m/mXp+fcwfJZ0OHGhJ2RPoo4p2RsJiEtNjRZMHSTGLs=
X-Gm-Gg: AY/fxX5bT0X+W5n4yKod3auwV0dl5s87RJLrlPBwc000uHQzyEF+iybD5OD5utS+SEa
	H4YpRZBjNNJTzHE/G5t44GAVtRLMd3+5zKftiPL7F/5rPWsyq00M4spl73BSN7yxw8H2zvQvlLg
	dmaDQ20VpZLIjW+u3RJDT7UKYUSZhwzg2Or8EZFoorNc9vBNnwJiy0rwsjAB7RQla+KeFKjxpV1
	h+lcjw8WrBI5s4jMSZRC3nyN8ZclF0aVXGCjpN4PXFjN8UdU4iyH9QDa60DQyDKs1jE/79tyxk9
	JGv2AWEo/Bnn0Q8V16Ew59VYldo28/QZZzUJjZsoevB4louGaaKX6pU2eZ9r5JeMYR9MVNlPFDh
	C/tSj2mN8r1WdH1FEXgvnXj+/tnNsOcu83B7HBXVNiNflbo6TAbZEF9NlpQlBbuTQCtx+85gnJw
	EYRC8FuFAWPIqf/IV2
X-Received: by 2002:a05:6000:1883:b0:430:fb00:108f with SMTP id ffacd0b85a97d-43569998e02mr11756656f8f.18.1768802891763;
        Sun, 18 Jan 2026 22:08:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ffcsm20657349f8f.18.2026.01.18.22.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:08:11 -0800 (PST)
Date: Mon, 19 Jan 2026 09:08:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/4] kernel/cgroup/cgroup.c:5780
 cgroup_create() warn: passing zero to 'ERR_PTR'
Message-ID: <202601161853.J6x4IThy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a58a97026588e9128868c7778ca1ffacbb53c931
commit: 2917fe4f77b5432ae691329891513c43ce250baa [4/4] ANDROID: cgroup: Use backport reservation for freeze time
config: i386-randconfig-141-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161853.J6x4IThy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601161853.J6x4IThy-lkp@intel.com/

smatch warnings:
kernel/cgroup/cgroup.c:5780 cgroup_create() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +5780 kernel/cgroup/cgroup.c

743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5660  static struct cgroup *cgroup_create(struct cgroup *parent, const char *name,
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5661  				    umode_t mode)
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5662  {
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5663  	struct cgroup_root *root = parent->root;
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5664  	struct cgroup *cgrp, *tcgrp;
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5665  	struct kernfs_node *kn;
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5666  	int level = parent->level + 1;
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5667  	int ret;
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5668  
0a950f65e1e64f kernel/cgroup.c        Tejun Heo          2012-11-19  5669  	/* allocate the cgroup and its ID, 0 is reserved for the root */
7f203bc89eb66d kernel/cgroup/cgroup.c Tejun Heo          2022-07-29  5670  	cgrp = kzalloc(struct_size(cgrp, ancestors, (level + 1)), GFP_KERNEL);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5671  	if (!cgrp)
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5672  		return ERR_PTR(-ENOMEM);
0ab02ca8f88790 kernel/cgroup.c        Li Zefan           2014-02-11  5673  
2aad2a86f6685c kernel/cgroup.c        Tejun Heo          2014-09-24  5674  	ret = percpu_ref_init(&cgrp->self.refcnt, css_release, 0, GFP_KERNEL);
9d755d33f0db8c kernel/cgroup.c        Tejun Heo          2014-05-14  5675  	if (ret)
9d755d33f0db8c kernel/cgroup.c        Tejun Heo          2014-05-14  5676  		goto out_free_cgrp;
9d755d33f0db8c kernel/cgroup.c        Tejun Heo          2014-05-14  5677  
c58632b3631cb2 kernel/cgroup/cgroup.c Tejun Heo          2018-04-26  5678  	ret = cgroup_rstat_init(cgrp);
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5679  	if (ret)
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5680  		goto out_cancel_ref;
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5681  
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5682  	/* create the directory */
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5683  	kn = kernfs_create_dir(parent->kn, name, mode, cgrp);
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5684  	if (IS_ERR(kn)) {
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5685  		ret = PTR_ERR(kn);
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5686  		goto out_stat_exit;
976c06bcccc505 kernel/cgroup.c        Tejun Heo          2012-11-05  5687  	}
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5688  	cgrp->kn = kn;
976c06bcccc505 kernel/cgroup.c        Tejun Heo          2012-11-05  5689  
cc31edceee04a7 kernel/cgroup.c        Paul Menage        2008-10-18  5690  	init_cgroup_housekeeping(cgrp);
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5691  
9d800df12d3173 kernel/cgroup.c        Tejun Heo          2014-05-14  5692  	cgrp->self.parent = &parent->self;
ba0f4d761503bd kernel/cgroup.c        Tejun Heo          2014-05-13  5693  	cgrp->root = root;
b11cfb5807e303 kernel/cgroup.c        Tejun Heo          2015-11-20  5694  	cgrp->level = level;
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5695  
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5696  	ret = psi_cgroup_alloc(cgrp);
324bda9e6c5add kernel/cgroup/cgroup.c Alexei Starovoitov 2017-10-02  5697  	if (ret)
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5698  		goto out_kernfs_remove;
b11cfb5807e303 kernel/cgroup.c        Tejun Heo          2015-11-20  5699  
9e67b054198f22 kernel/cgroup/cgroup.c Chen Ridong        2024-10-18  5700  	if (cgrp->root == &cgrp_dfl_root) {
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5701  		ret = cgroup_bpf_inherit(cgrp);
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5702  		if (ret)
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5703  			goto out_psi_free;
9e67b054198f22 kernel/cgroup/cgroup.c Chen Ridong        2024-10-18  5704  	}
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5705  
2917fe4f77b543 kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5706  	cgrp->kmi_ext_info = kzalloc(sizeof(*cgrp->kmi_ext_info), GFP_KERNEL);
2917fe4f77b543 kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5707  	if (!cgrp->kmi_ext_info)
2917fe4f77b543 kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5708  		goto out_psi_free;

missing error code.

2917fe4f77b543 kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5709  
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5710  	/*
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5711  	 * New cgroup inherits effective freeze counter, and
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5712  	 * if the parent has to be frozen, the child has too.
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5713  	 */
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5714  	cgrp->freezer.e_freeze = parent->freezer.e_freeze;
2917fe4f77b543 kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5715  	seqcount_init(&cgrp->kmi_ext_info->freezer.freeze_seq);
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5716  	if (cgrp->freezer.e_freeze) {
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5717  		/*
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5718  		 * Set the CGRP_FREEZE flag, so when a process will be
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5719  		 * attached to the child cgroup, it will become frozen.
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5720  		 * At this point the new cgroup is unpopulated, so we can
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5721  		 * consider it frozen immediately.
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5722  		 */
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5723  		set_bit(CGRP_FREEZE, &cgrp->flags);
2917fe4f77b543 kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5724  		cgrp->kmi_ext_info->freezer.freeze_start_nsec = ktime_get_ns();
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5725  		set_bit(CGRP_FROZEN, &cgrp->flags);
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5726  	}
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5727  
4dcabece4c3a9f kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5728  	spin_lock_irq(&css_set_lock);
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5729  	for (tcgrp = cgrp; tcgrp; tcgrp = cgroup_parent(tcgrp)) {
7f203bc89eb66d kernel/cgroup/cgroup.c Tejun Heo          2022-07-29  5730  		cgrp->ancestors[tcgrp->level] = tcgrp;
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5731  
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5732  		if (tcgrp != cgrp) {
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5733  			tcgrp->nr_descendants++;
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5734  
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5735  			/*
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5736  			 * If the new cgroup is frozen, all ancestor cgroups
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5737  			 * get a new frozen descendant, but their state can't
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5738  			 * change because of this.
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5739  			 */
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5740  			if (cgrp->freezer.e_freeze)
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5741  				tcgrp->freezer.nr_frozen_descendants++;
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5742  		}
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5743  	}
4dcabece4c3a9f kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5744  	spin_unlock_irq(&css_set_lock);
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5745  
b6abdb0e6ca5c2 kernel/cgroup.c        Li Zefan           2008-03-04  5746  	if (notify_on_release(parent))
b6abdb0e6ca5c2 kernel/cgroup.c        Li Zefan           2008-03-04  5747  		set_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
b6abdb0e6ca5c2 kernel/cgroup.c        Li Zefan           2008-03-04  5748  
2260e7fc1f18ad kernel/cgroup.c        Tejun Heo          2012-11-19  5749  	if (test_bit(CGRP_CPUSET_CLONE_CHILDREN, &parent->flags))
2260e7fc1f18ad kernel/cgroup.c        Tejun Heo          2012-11-19  5750  		set_bit(CGRP_CPUSET_CLONE_CHILDREN, &cgrp->flags);
97978e6d1f2da0 kernel/cgroup.c        Daniel Lezcano     2010-10-27  5751  
0cb51d71c1fa92 kernel/cgroup.c        Tejun Heo          2014-05-16  5752  	cgrp->self.serial_nr = css_serial_nr_next++;
53fa5261747a90 kernel/cgroup.c        Tejun Heo          2013-05-24  5753  
4e139afc22cb98 kernel/cgroup.c        Tejun Heo          2012-11-19  5754  	/* allocation complete, commit to creation */
d5c419b68e368f kernel/cgroup.c        Tejun Heo          2014-05-16  5755  	list_add_tail_rcu(&cgrp->self.sibling, &cgroup_parent(cgrp)->self.children);
3c9c825b8b50de kernel/cgroup.c        Tejun Heo          2014-02-12  5756  	atomic_inc(&root->nr_cgrps);
a590b90d472f2c kernel/cgroup/cgroup.c Tejun Heo          2017-04-28  5757  	cgroup_get_live(parent);
415cf07a1c1c65 kernel/cgroup.c        Li Zefan           2013-04-08  5758  
bd53d617b34c78 kernel/cgroup.c        Tejun Heo          2014-04-23  5759  	/*
bd53d617b34c78 kernel/cgroup.c        Tejun Heo          2014-04-23  5760  	 * On the default hierarchy, a child doesn't automatically inherit
667c24917144e3 kernel/cgroup.c        Tejun Heo          2014-07-08  5761  	 * subtree_control from the parent.  Each is configured manually.
bd53d617b34c78 kernel/cgroup.c        Tejun Heo          2014-04-23  5762  	 */
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5763  	if (!cgroup_on_dfl(cgrp))
5531dc915ba10b kernel/cgroup.c        Tejun Heo          2016-03-03  5764  		cgrp->subtree_control = cgroup_control(cgrp);
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5765  
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5766  	cgroup_propagate_control(cgrp);
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5767  
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5768  	return cgrp;
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5769  
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5770  out_psi_free:
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5771  	psi_cgroup_free(cgrp);
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5772  out_kernfs_remove:
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5773  	kernfs_remove(cgrp->kn);
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5774  out_stat_exit:
c58632b3631cb2 kernel/cgroup/cgroup.c Tejun Heo          2018-04-26  5775  	cgroup_rstat_exit(cgrp);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5776  out_cancel_ref:
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5777  	percpu_ref_exit(&cgrp->self.refcnt);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5778  out_free_cgrp:
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5779  	kfree(cgrp);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03 @5780  	return ERR_PTR(ret);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5781  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

