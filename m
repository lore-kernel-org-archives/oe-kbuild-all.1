Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD894C81
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 13:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110172; cv=none; b=MPn009ZBWiGMC/qwjH+mxLo3LIN2tUm9pChH7Ul94/8nsJz+yTpGZdtOeehPBBKS9a/OlYcxQ53/a4amADC2xxRH5NwrswPZa0L2SKJXz7F1vsW7MGsauXO192qI0VWVe3whyYaVsYwors5OrD+X6vxpqs5P8QZOaCJLXX1+2ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110172; c=relaxed/simple;
	bh=+FMr+qTUuD0DTHsZ/rGQVjSMQw32irY9xQtjay3kXoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aMz2g56Q+spJVO3NECsCjPl7Xop+ZwDjnJyy+vRkA9FETvnCj9gPDE6wyP03ZkO9/Z6BpgfqUrHJ9CEViwjAo8fwHg8ZrQ797VFXLtk4jPQs2w0lxngWnNUr44FxRKXPuIf06k8pbn8L+w6tw799Gon62eVAx4Tk4h+RIMBErg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXwu66dJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXwu66dJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725110171; x=1756646171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+FMr+qTUuD0DTHsZ/rGQVjSMQw32irY9xQtjay3kXoo=;
  b=YXwu66dJJghb8arMToI8U7MVptcqj0bJB2klmH5Q0DIuFTOQji0Orodv
   BsBr2hCgN/EQz1mMVnCHR9wWHS8pn3/S3gtWk0gMfrds4HvMkFV/1kY3U
   G+PPC7iS6JoYyK1vu5SzN75GIxY7Q98vYaS4YAyFTzYVedyvHQPZRbZ3O
   hQTHFUzRBzHcMRpWELZT7pBi2e5qMACtjXALaqA27zvPu1+QwdA9oRCNt
   PyLF7xIR0FbzFRAB2ba3FgtJwmHs6bZSNe4d0Im3zVQGunjOiL1x6UmLQ
   u2nk3M9+E5H178q9VcV+EFW1jo/6LFbxNyn6ImSSn7wi9WGSVokcTRvAO
   g==;
X-CSE-ConnectionGUID: OKTw6EN7RKCLXoayxKIUyQ==
X-CSE-MsgGUID: CbvM1egHTK2i9DvNZiA90Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34361162"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="34361162"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 06:16:08 -0700
X-CSE-ConnectionGUID: EidMsjCyTl6q7TgnVaGwZg==
X-CSE-MsgGUID: YFdxtC5ETh6XNou94yNxSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64656692"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Aug 2024 06:16:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skNxU-0002mH-2o;
	Sat, 31 Aug 2024 13:16:04 +0000
Date: Sat, 31 Aug 2024 21:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.f_version.wip.v1 9/23] fs/read_write.c:149:
 warning: Function parameter or struct member 'maxsize' not described in
 'generic_versioned_llseek_size'
Message-ID: <202408312117.BaopGaVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.f_version.wip.v1
head:   10d96ef0be4c7b10c4ff37c167a9979df936ee08
commit: b7397e484031c5aa0a725efcc5a3d5d7c4a85af3 [9/23] fs: add generic_versioned_llseek() helper
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240831/202408312117.BaopGaVn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408312117.BaopGaVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408312117.BaopGaVn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/read_write.c:149: warning: Function parameter or struct member 'maxsize' not described in 'generic_versioned_llseek_size'
>> fs/read_write.c:149: warning: Function parameter or struct member 'eof' not described in 'generic_versioned_llseek_size'
>> fs/read_write.c:149: warning: expecting prototype for generic_versioned_llseek(). Prototype was for generic_versioned_llseek_size() instead


vim +149 fs/read_write.c

   133	
   134	/**
   135	 * generic_versioned_llseek - versioned llseek implementation
   136	 * @file:	file structure to seek on
   137	 * @offset:	file offset to seek to
   138	 * @whence:	type of seek
   139	 * @seek_version: version number to update
   140	 *
   141	 * See generic_file_llseek for a general description and locking assumptions.
   142	 *
   143	 * In contrast to generic_file_llseek, this function also resets a version
   144	 * counter the filesystem provides.
   145	 */
   146	loff_t generic_versioned_llseek_size(struct file *file, loff_t offset,
   147					     int whence, loff_t maxsize, loff_t eof,
   148					     u64 *seek_version)
 > 149	{
   150		bool must_lock = false;
   151	
   152		if (WARN_ON_ONCE(!seek_version))
   153			return -EINVAL;
   154	
   155		switch (whence) {
   156		case SEEK_END:
   157			offset += eof;
   158			break;
   159		case SEEK_CUR:
   160			/*
   161			 * Here we special-case the lseek(fd, 0, SEEK_CUR)
   162			 * position-querying operation.  Avoid rewriting the "same"
   163			 * f_pos value back to the file because a concurrent read(),
   164			 * write() or lseek() might have altered it
   165			 */
   166			if (offset == 0)
   167				return file->f_pos;
   168			/*
   169			 * f_lock protects against read/modify/write race with other
   170			 * SEEK_CURs. Note that parallel writes and reads behave
   171			 * like SEEK_SET.
   172			 */
   173			must_lock = true;
   174			break;
   175		case SEEK_DATA:
   176			/*
   177			 * In the generic case the entire file is data, so as long as
   178			 * offset isn't at the end of the file then the offset is data.
   179			 */
   180			if ((unsigned long long)offset >= eof)
   181				return -ENXIO;
   182			break;
   183		case SEEK_HOLE:
   184			/*
   185			 * There is a virtual hole at the end of the file, so as long as
   186			 * offset isn't i_size or larger, return i_size.
   187			 */
   188			if ((unsigned long long)offset >= eof)
   189				return -ENXIO;
   190			offset = eof;
   191			break;
   192		}
   193	
   194		if (must_lock)
   195			spin_lock(&file->f_lock);
   196	
   197		if (offset < 0 && !unsigned_offsets(file))
   198			return -EINVAL;
   199		if (offset > maxsize)
   200			return -EINVAL;
   201	
   202		if (offset != file->f_pos) {
   203			file->f_pos = offset;
   204			*seek_version = 0;
   205		}
   206	
   207		if (must_lock)
   208			spin_unlock(&file->f_lock);
   209	
   210		return offset;
   211	}
   212	EXPORT_SYMBOL(generic_versioned_llseek_size);
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
