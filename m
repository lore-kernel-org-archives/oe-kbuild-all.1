Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39A8282E5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 05:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717132627; cv=none; b=PSZfwu3XrZjqYxMedw1IkJ/Mi6Z+Aa4QwkoJSuH3KhokvRriaBQWlX1OAy8KfB+pj3Bn3mBIsho7z9ztvvKYC+ST9ejrNrgZaq1O0v6rtYSpMoa/uRvT1EX+j82ETOLR2vRrSe7vg2wpFTAprL+R/v1qHNJb2zbjG31DcbNmT1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717132627; c=relaxed/simple;
	bh=hj4cINFD09/nju2WNnkaDzRK1qXMI0tbnS5LF2da3+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qMKIuiUYcgLwjOMfNNMJ7aFGheqluccxhD2tGv9zalB2lrAbKx01uALJTD4Pvasy/Mb1qcthHrsGBw5Gn0+FKWU7lKL14ofblMOVRlI6p4UPpU0JwRCKEMFYGaYmV9g37QyMYgUh8gl6arLjkbzMZSVElqFWxHrGQdOizg2UtRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2Wcuu/y; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2Wcuu/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717132626; x=1748668626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hj4cINFD09/nju2WNnkaDzRK1qXMI0tbnS5LF2da3+M=;
  b=T2Wcuu/ydRnRcYuiV/wSBMOQtx9NteKkSeYXQuRw76Km2p+3h0P70VyF
   Tr9zOhP9hAU0TNdr9rL8TTHOWBEgJrsmHSWkf4DUbu+q00/lDigKtyhXt
   8d7yNKRBHOye4JkRsQ1Ch6xUrrFOR3FesK1luniwHvNOAkCFa/n5rrxsu
   M8vssEpBYFt1990dB6nBem954zNyHwwe17DI3Rjcv8vWAoN3YPJ2tT8n9
   weTnUPCwey68XpdjqaXBDv+7MIEi0sHY1jV0audFA836u/3sc+kTHH+uo
   s5xO5JF3IDDlDtlXnWVOopKwri9cunoqqQ7IgjTQ6SOeamLimk8B4GWZq
   g==;
X-CSE-ConnectionGUID: DrGqFIwVRYqf6DeFWhCPvQ==
X-CSE-MsgGUID: s88Q7B39SES4l/OkQNl2cA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13787304"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="13787304"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 22:15:52 -0700
X-CSE-ConnectionGUID: btUxrYc0Q7O5TTUlSahTYQ==
X-CSE-MsgGUID: D1w9gRRmTkakd07bvw9MmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36140899"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 May 2024 22:15:51 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCucG-000GYh-28;
	Fri, 31 May 2024 05:15:48 +0000
Date: Fri, 31 May 2024 13:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 90/93]
 fs/bcachefs/thread_with_file.c:375:2: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202405311303.OgaXyM1M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ce6297d0475422fa2de0db1d4f955633ba70d031
commit: 21091985987e4fcc4580030d896ac35906041d22 [90/93] bcachefs: bch2_stdio_redirect_readline_timeout()
config: i386-buildonly-randconfig-002-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311303.OgaXyM1M-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311303.OgaXyM1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311303.OgaXyM1M-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/thread_with_file.c: In function 'bch2_stdio_redirect_readline_timeout':
>> fs/bcachefs/thread_with_file.c:375:2: error: a label can only be part of a statement and a declaration is not a statement
     unsigned long t = timeout != MAX_SCHEDULE_TIMEOUT
     ^~~~~~~~


vim +375 fs/bcachefs/thread_with_file.c

   366	
   367	int bch2_stdio_redirect_readline_timeout(struct stdio_redirect *stdio,
   368						 darray_char *line,
   369						 unsigned long timeout)
   370	{
   371		unsigned long until = jiffies + timeout;
   372		struct stdio_buf *buf = &stdio->input;
   373		size_t seen = 0;
   374	again:
 > 375		unsigned long t = timeout != MAX_SCHEDULE_TIMEOUT
   376			? max_t(long, until - jiffies, 0)
   377			: timeout;
   378	
   379		t = min(t, sysctl_hung_task_timeout_secs * HZ / 2);
   380	
   381		wait_event_timeout(buf->wait, stdio_redirect_has_more_input(stdio, seen), t);
   382	
   383		if (stdio->done)
   384			return -1;
   385	
   386		spin_lock(&buf->lock);
   387		seen = buf->buf.nr;
   388		char *n = memchr(buf->buf.data, '\n', seen);
   389	
   390		if (!n && timeout != MAX_SCHEDULE_TIMEOUT && jiffies >= until) {
   391			spin_unlock(&buf->lock);
   392			return -ETIME;
   393		}
   394	
   395		if (!n) {
   396			buf->waiting_for_line = true;
   397			spin_unlock(&buf->lock);
   398			goto again;
   399		}
   400	
   401		size_t b = n + 1 - buf->buf.data;
   402		if (b > line->size) {
   403			spin_unlock(&buf->lock);
   404			int ret = darray_resize(line, b);
   405			if (ret)
   406				return ret;
   407			seen = 0;
   408			goto again;
   409		}
   410	
   411		buf->buf.nr -= b;
   412		memcpy(line->data, buf->buf.data, b);
   413		memmove(buf->buf.data,
   414			buf->buf.data + b,
   415			buf->buf.nr);
   416		line->nr = b;
   417	
   418		buf->waiting_for_line = false;
   419		spin_unlock(&buf->lock);
   420	
   421		wake_up(&buf->wait);
   422		return 0;
   423	}
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
