Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894A91BA86C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 18:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718909364; cv=none; b=TyFrgCdoLPBHdFeK+GefR6ZWkEXy7qFKeiH6QjbtoBSbIShXc9GkVBhCJEyhnH464q3+v4enWEkqx8kirlvrFokhFDWtkXOuQWYwBsNS3Vvb67qAiu5kz17pCCu0kyN9hof2WOmzOIxK/3upkfYi5HzdNy67JlPV+nV+DWgFZ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718909364; c=relaxed/simple;
	bh=dP7fNL3RVrDi7AOZJTCaU3sM59FV71IZROEQFSTCK7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ucNuQDQ503H6Ed7xtFJEiDVE088dxySxohkzba84D6DnV8UTZFMSPxLdu4yQh74m7nHsrbqxdjCg3uJWa7Kxan4wpSGCI+arzB3c4MhCtnW583yQRo0zIHIcWYgo29rq7eT9HMnWVvkjva/u6bFVuw2YZ4BX7Dw32E0h1EO0MlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jB9ArioD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jB9ArioD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718909358; x=1750445358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dP7fNL3RVrDi7AOZJTCaU3sM59FV71IZROEQFSTCK7E=;
  b=jB9ArioD2Ub5GZajJks/YWwIXieM+76u/GeS7icft9uniu0ZwTHF/vlf
   X/g5KtrxAes90kZqiusn58KfZhn5yA0FcWMBjzT5EglVP+3x4VxyWrs1t
   m2UkqRA7wuvZSqeS3cYYCZeUTv9P/TrzTjUOSaccoKzagWi9PgaWftjyJ
   lk0LT1yBySafQDxrX4mXkvX80tNpEP0T5INFGDLlbzuL59JWXIOzy4Bkh
   9LRPMyRJRZJh8C9ecJVWQuGQS9wqgoql0PGo/ecphjNcpwzXbrOFyq8kj
   iFI9QqwlCh36zI8jMiNmQcZWoLWfoAapjgpqrbSV+yLxSp3672YFfWu76
   Q==;
X-CSE-ConnectionGUID: pQbWFMP/QMqhBM7UfUYRdg==
X-CSE-MsgGUID: kchp7VxbTV2CKwcGZQuqXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="38432506"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="38432506"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 11:49:18 -0700
X-CSE-ConnectionGUID: UuO9e6ZqSyq/CNq9+YHKfQ==
X-CSE-MsgGUID: i27Y65hGROWTWV4XEgwtTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="65586505"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jun 2024 11:49:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKMqQ-0007qM-1A;
	Thu, 20 Jun 2024 18:49:14 +0000
Date: Fri, 21 Jun 2024 02:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.ns_ioctl 2/2] fs/nsfs.c:199:1: warning: control
 reaches end of non-void function
Message-ID: <202406210252.E8ORtphu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.ns_ioctl
head:   8677ab84123aeb7a4ecb3b911d28e7bd547495df
commit: 8677ab84123aeb7a4ecb3b911d28e7bd547495df [2/2] nsfs: add pid translation ioctls
config: i386-buildonly-randconfig-003-20240620 (https://download.01.org/0day-ci/archive/20240621/202406210252.E8ORtphu-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210252.E8ORtphu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210252.E8ORtphu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nsfs.c: In function 'ns_ioctl':
>> fs/nsfs.c:199:1: warning: control reaches end of non-void function [-Wreturn-type]
     199 | }
         | ^


vim +199 fs/nsfs.c

6786741dbf99e4 Andrey Vagin                2016-09-06  122  
6786741dbf99e4 Andrey Vagin                2016-09-06  123  static long ns_ioctl(struct file *filp, unsigned int ioctl,
6786741dbf99e4 Andrey Vagin                2016-09-06  124  			unsigned long arg)
6786741dbf99e4 Andrey Vagin                2016-09-06  125  {
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  126) 	struct user_namespace *user_ns;
8677ab84123aeb Christian Brauner           2020-06-07  127  	struct pid_namespace *pid_ns;
8677ab84123aeb Christian Brauner           2020-06-07  128  	struct task_struct *tsk;
6786741dbf99e4 Andrey Vagin                2016-09-06  129  	struct ns_common *ns = get_proc_ns(file_inode(filp));
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  130) 	uid_t __user *argp;
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  131) 	uid_t uid;
8677ab84123aeb Christian Brauner           2020-06-07  132  	pid_t pid_nr;
6786741dbf99e4 Andrey Vagin                2016-09-06  133  
6786741dbf99e4 Andrey Vagin                2016-09-06  134  	switch (ioctl) {
6786741dbf99e4 Andrey Vagin                2016-09-06  135  	case NS_GET_USERNS:
6786741dbf99e4 Andrey Vagin                2016-09-06  136  		return open_related_ns(ns, ns_get_owner);
a7306ed8d94af7 Andrey Vagin                2016-09-06  137  	case NS_GET_PARENT:
a7306ed8d94af7 Andrey Vagin                2016-09-06  138  		if (!ns->ops->get_parent)
a7306ed8d94af7 Andrey Vagin                2016-09-06  139  			return -EINVAL;
a7306ed8d94af7 Andrey Vagin                2016-09-06  140  		return open_related_ns(ns, ns->ops->get_parent);
e5ff5ce6e20ee2 Michael Kerrisk (man-pages  2017-01-25  141) 	case NS_GET_NSTYPE:
e5ff5ce6e20ee2 Michael Kerrisk (man-pages  2017-01-25  142) 		return ns->ops->type;
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  143) 	case NS_GET_OWNER_UID:
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  144) 		if (ns->ops->type != CLONE_NEWUSER)
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  145) 			return -EINVAL;
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  146) 		user_ns = container_of(ns, struct user_namespace, ns);
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  147) 		argp = (uid_t __user *) arg;
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  148) 		uid = from_kuid_munged(current_user_ns(), user_ns->owner);
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  149) 		return put_user(uid, argp);
8677ab84123aeb Christian Brauner           2020-06-07  150  	case NS_GET_PID_FROM_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  151  		fallthrough;
8677ab84123aeb Christian Brauner           2020-06-07  152  	case NS_GET_TGID_FROM_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  153  		fallthrough;
8677ab84123aeb Christian Brauner           2020-06-07  154  	case NS_GET_PID_IN_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  155  		fallthrough;
8677ab84123aeb Christian Brauner           2020-06-07  156  	case NS_GET_TGID_IN_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  157  		if (ns->ops->type != CLONE_NEWPID)
8677ab84123aeb Christian Brauner           2020-06-07  158  			return -EINVAL;
8677ab84123aeb Christian Brauner           2020-06-07  159  
8677ab84123aeb Christian Brauner           2020-06-07  160  		pid_nr = -ESRCH;
8677ab84123aeb Christian Brauner           2020-06-07  161  		pid_ns = container_of(ns, struct pid_namespace, ns);
8677ab84123aeb Christian Brauner           2020-06-07  162  
8677ab84123aeb Christian Brauner           2020-06-07  163  		rcu_read_lock();
8677ab84123aeb Christian Brauner           2020-06-07  164  
8677ab84123aeb Christian Brauner           2020-06-07  165  		if (ioctl == NS_GET_PID_IN_PIDNS ||
8677ab84123aeb Christian Brauner           2020-06-07  166  		    ioctl == NS_GET_TGID_IN_PIDNS)
8677ab84123aeb Christian Brauner           2020-06-07  167  			tsk = find_task_by_vpid(arg);
8677ab84123aeb Christian Brauner           2020-06-07  168  		else
8677ab84123aeb Christian Brauner           2020-06-07  169  			tsk = find_task_by_pid_ns(arg, pid_ns);
8677ab84123aeb Christian Brauner           2020-06-07  170  		if (!tsk)
8677ab84123aeb Christian Brauner           2020-06-07  171  			break;
8677ab84123aeb Christian Brauner           2020-06-07  172  
8677ab84123aeb Christian Brauner           2020-06-07  173  		switch (ioctl) {
8677ab84123aeb Christian Brauner           2020-06-07  174  		case NS_GET_PID_FROM_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  175  			pid_nr = task_pid_vnr(tsk);
8677ab84123aeb Christian Brauner           2020-06-07  176  			break;
8677ab84123aeb Christian Brauner           2020-06-07  177  		case NS_GET_TGID_FROM_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  178  			pid_nr = task_tgid_vnr(tsk);
8677ab84123aeb Christian Brauner           2020-06-07  179  			break;
8677ab84123aeb Christian Brauner           2020-06-07  180  		case NS_GET_PID_IN_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  181  			pid_nr = task_pid_nr_ns(tsk, pid_ns);
8677ab84123aeb Christian Brauner           2020-06-07  182  			break;
8677ab84123aeb Christian Brauner           2020-06-07  183  		case NS_GET_TGID_IN_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  184  			pid_nr = task_tgid_nr_ns(tsk, pid_ns);
8677ab84123aeb Christian Brauner           2020-06-07  185  			break;
8677ab84123aeb Christian Brauner           2020-06-07  186  		default:
8677ab84123aeb Christian Brauner           2020-06-07  187  			pid_nr = 0;
8677ab84123aeb Christian Brauner           2020-06-07  188  			break;
8677ab84123aeb Christian Brauner           2020-06-07  189  		}
8677ab84123aeb Christian Brauner           2020-06-07  190  		rcu_read_unlock();
8677ab84123aeb Christian Brauner           2020-06-07  191  
8677ab84123aeb Christian Brauner           2020-06-07  192  		if (!pid_nr)
8677ab84123aeb Christian Brauner           2020-06-07  193  			return -ESRCH;
8677ab84123aeb Christian Brauner           2020-06-07  194  
8677ab84123aeb Christian Brauner           2020-06-07  195  		return pid_nr;
6786741dbf99e4 Andrey Vagin                2016-09-06  196  	default:
6786741dbf99e4 Andrey Vagin                2016-09-06  197  		return -ENOTTY;
6786741dbf99e4 Andrey Vagin                2016-09-06  198  	}
6786741dbf99e4 Andrey Vagin                2016-09-06 @199  }
6786741dbf99e4 Andrey Vagin                2016-09-06  200  

:::::: The code at line 199 was first introduced by commit
:::::: 6786741dbf99e44fb0c0ed85a37582b8a26f1c3b nsfs: add ioctl to get an owning user namespace for ns file descriptor

:::::: TO: Andrey Vagin <avagin@openvz.org>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
