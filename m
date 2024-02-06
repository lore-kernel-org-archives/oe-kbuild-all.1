Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ADC7FBA9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 05:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707196858; cv=none; b=FMe0drAnyZ3xoCbbJgXtOLTkn6/ZufHpafyOaiIKyeNDhgLGVXj/feWSE7vQTcOqPrBS6Z/haoSIlYf8jlQRIBGME3K6Ood/otwHeINVEjEjQjyUB5PozzsUVNDYawCH9jNvHsPmcqEdAW7V7JFmQb3IcWTbbz3kTymNqRhcEGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707196858; c=relaxed/simple;
	bh=O1QBIMdMz7g2UhoypX8aCR2AdP6uvSsbIjboQKRKdU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bOjr0Oe+IKaPgiA2euVpCOgyIx3D287oZQNjbYf2+pnnDcOvmrJf4n+Y43okf7VKvDjaWb6VaEoa2q6k7tVaFMVjHlLUrRfm+EXWzzYdolFrfrp3+4+rx/DIVeJSIg5KKed16yb2GUD+ijtswwjeoJZo5KiDdhCP2eB0SXcg034=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXsCxOye; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXsCxOye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707196856; x=1738732856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O1QBIMdMz7g2UhoypX8aCR2AdP6uvSsbIjboQKRKdU8=;
  b=iXsCxOyeEJtVut947JoSfk2e0GVMnhz/3IXcDvJlgQilzGPbcV9uVa8f
   UycJO4rFJXPtVER247tfQyOC4fTKJ0BHemMWWrNLfad8JBIjUEDtrtCJu
   rTO8bRaON3cyoyshkAPdoWqXnrC1Y14qhpTFS/mQvOC76ktCB9OVcz3wV
   +zt75sgJwkZIU9OlYuvTtUQpHZSyeWvzWXTpLIVF2pXBbTat7azghoCGw
   hlLyB0CXmomckjGSI06NbgPI0T8+i2o6kJOzxol8N942KRHmPjSmKLFEZ
   advuhK3Tn86VH0J8XSYprUK19she1dKjk9nhQA4L5hohOo4kuNBEKYKsK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11320687"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="11320687"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 21:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="5672794"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Feb 2024 21:20:51 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXDt3-00015S-0C;
	Tue, 06 Feb 2024 05:20:49 +0000
Date: Tue, 6 Feb 2024 13:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Brauner <brauner@kernel.org>, NeilBrown <neilb@suse.de>
Subject: [linux-next:master 3181/4021] fs/smb/client/file.c:1684:13: error:
 implicit declaration of function 'lock_is_write'; did you mean
 'op_is_write'?
Message-ID: <202402061335.qwIGBbl0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   23e11d0318521e8693459b0e4d23aec614b3b68b
commit: 39647541cb269fded1345c1e522f829e144f5af8 [3181/4021] smb/client: convert to using new filelock helpers
config: arc-randconfig-002-20240204 (https://download.01.org/0day-ci/archive/20240206/202402061335.qwIGBbl0-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402061335.qwIGBbl0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402061335.qwIGBbl0-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/file.c: In function 'cifs_read_flock':
>> fs/smb/client/file.c:1684:13: error: implicit declaration of function 'lock_is_write'; did you mean 'op_is_write'? [-Werror=implicit-function-declaration]
    1684 |         if (lock_is_write(flock)) {
         |             ^~~~~~~~~~~~~
         |             op_is_write
>> fs/smb/client/file.c:1688:20: error: implicit declaration of function 'lock_is_unlock'; did you mean 'lock_pin_lock'? [-Werror=implicit-function-declaration]
    1688 |         } else if (lock_is_unlock(flock)) {
         |                    ^~~~~~~~~~~~~~
         |                    lock_pin_lock
>> fs/smb/client/file.c:1693:20: error: implicit declaration of function 'lock_is_read'; did you mean 'lock_is_held'? [-Werror=implicit-function-declaration]
    1693 |         } else if (lock_is_read(flock)) {
         |                    ^~~~~~~~~~~~
         |                    lock_is_held
   cc1: some warnings being treated as errors


vim +1684 fs/smb/client/file.c

  1661	
  1662	static void
  1663	cifs_read_flock(struct file_lock *flock, __u32 *type, int *lock, int *unlock,
  1664			bool *wait_flag, struct TCP_Server_Info *server)
  1665	{
  1666		if (flock->fl_flags & FL_POSIX)
  1667			cifs_dbg(FYI, "Posix\n");
  1668		if (flock->fl_flags & FL_FLOCK)
  1669			cifs_dbg(FYI, "Flock\n");
  1670		if (flock->fl_flags & FL_SLEEP) {
  1671			cifs_dbg(FYI, "Blocking lock\n");
  1672			*wait_flag = true;
  1673		}
  1674		if (flock->fl_flags & FL_ACCESS)
  1675			cifs_dbg(FYI, "Process suspended by mandatory locking - not implemented yet\n");
  1676		if (flock->fl_flags & FL_LEASE)
  1677			cifs_dbg(FYI, "Lease on file - not implemented yet\n");
  1678		if (flock->fl_flags &
  1679		    (~(FL_POSIX | FL_FLOCK | FL_SLEEP |
  1680		       FL_ACCESS | FL_LEASE | FL_CLOSE | FL_OFDLCK)))
  1681			cifs_dbg(FYI, "Unknown lock flags 0x%x\n", flock->fl_flags);
  1682	
  1683		*type = server->vals->large_lock_type;
> 1684		if (lock_is_write(flock)) {
  1685			cifs_dbg(FYI, "F_WRLCK\n");
  1686			*type |= server->vals->exclusive_lock_type;
  1687			*lock = 1;
> 1688		} else if (lock_is_unlock(flock)) {
  1689			cifs_dbg(FYI, "F_UNLCK\n");
  1690			*type |= server->vals->unlock_lock_type;
  1691			*unlock = 1;
  1692			/* Check if unlock includes more than one lock range */
> 1693		} else if (lock_is_read(flock)) {
  1694			cifs_dbg(FYI, "F_RDLCK\n");
  1695			*type |= server->vals->shared_lock_type;
  1696			*lock = 1;
  1697		} else if (flock->fl_type == F_EXLCK) {
  1698			cifs_dbg(FYI, "F_EXLCK\n");
  1699			*type |= server->vals->exclusive_lock_type;
  1700			*lock = 1;
  1701		} else if (flock->fl_type == F_SHLCK) {
  1702			cifs_dbg(FYI, "F_SHLCK\n");
  1703			*type |= server->vals->shared_lock_type;
  1704			*lock = 1;
  1705		} else
  1706			cifs_dbg(FYI, "Unknown type of lock\n");
  1707	}
  1708	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
