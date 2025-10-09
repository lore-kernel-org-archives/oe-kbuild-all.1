Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E883285052
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999338; cv=none; b=hrGXTlDX9N+Ct696ouOPFr301SaQ4cKjEYjfZnAO6CnyD1bB1fkxeGXb4SGa895aWYbQHC97/VHrDWPUWSgKKb52YVnnNexLOZrLaqordQk4+h30Wr28blrZLBfItsiCyI45ystDRRijR/92VekUD55hDdqLOdjNDrh2eDJx4sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999338; c=relaxed/simple;
	bh=MPiUyF/wscxeCSjC2BoH892dZSkJZ7zH4ADi3ZdKJNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JJxxEFuuHBnig/P1fakYVRSOlKINsTCEmzPW/Cz5sXocH9RyuzTHDLrJfL9aNXgUKsqvB7zORVkAlIpDv8EsfaGYl6Myew08D4q32+vNKJvCbEnNaGDzM71WYqTS3tcWPAHsVFkZdiYhfdrxi6BLW6cYPO+ZR8sRXLcy7LbmLt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqXwJwzn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqXwJwzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759999337; x=1791535337;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=MPiUyF/wscxeCSjC2BoH892dZSkJZ7zH4ADi3ZdKJNQ=;
  b=SqXwJwznHgNjdLFKvNRc463b8B2I5WCY7vfUYk8dZavQRLfqRGOv3rcD
   r+4ZCrnNInpc9QCXPDCreA9jgdgy69CgZhOCAqgOL4U6GMsSYfahTY6Sa
   59Yfse0Czra1Jzuf5Fut8vuycFHgwU3V/TqKKdsermyQTLiFrcsLxzK8G
   6MSF/aDr6gjR1xlVnhmhPkEedioY3/9gZzSmMQJwZ24KdNAk/rX4dh/r4
   brA8zGOSi75zzQJbQHfpJ7KTQL6Ms1cPyqc0uOcK+gyddAtdvK53BhusZ
   sNPjlJHipEqEFCtlKJfRIKUMLz3K3PMsQNMnveK/oB8Q6fJrbfN7oZf+3
   w==;
X-CSE-ConnectionGUID: L3TxdHfTSymA5U/V7jhZtA==
X-CSE-MsgGUID: DJ2YcMuAScyKfiMZjcMXzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="66056183"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="66056183"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 01:42:16 -0700
X-CSE-ConnectionGUID: vb+HGZaaQBazQKeGZckvsg==
X-CSE-MsgGUID: iwlhpl0fRxq9nYykzVp4ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="180601419"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2025 01:42:16 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6mE1-0000KB-1n;
	Thu, 09 Oct 2025 08:42:13 +0000
Date: Thu, 9 Oct 2025 16:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: pip-izony <eeodqql09@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] Input: pegasus-notetaker - fix out-of-bounds access
 vulnerability in pegasus_parse_packet() function of the pegasus driver
Message-ID: <aOd1QICnH8j-EyEe@d0417ff97f04>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007214131.3737115-2-eeodqql09@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] Input: pegasus-notetaker - fix out-of-bounds access vulnerability in pegasus_parse_packet() function of the pegasus driver
Link: https://lore.kernel.org/stable/20251007214131.3737115-2-eeodqql09%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



