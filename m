Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138971388
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 05:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729144682; cv=none; b=IIfgdliTsnxKufV6MBCjXnz6x0Trrzdh86TXJBX3U/SFArFv6S8pkKKnmr+4l+uZWIfp7/5CQ0WjZKbCj6KXYjPEYQry2ZlVU5hluVHPtg+xlYL7H+2UxfS3xJbIi13iFnNU4SwHFrHgZBXb23iRK5CXH/A4lRPN9sUxs/0CIIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729144682; c=relaxed/simple;
	bh=cIop3ta76NB9VhqfBbqgzgJ7F2ZlyX8UgmJTMLTIPx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/DriR0TUjQ7b1FYyxiGL+fwTKgOirZwxi0Yht5sSgKySAhKm+zdUmbWkWkdtwibtg2DRjKsnSO60Le0/19RsR7jruG3/VBpYjXRl2pCpFzuTq6IiJoeaIURWYkKZzOznXrtbWo+xVbf35xN/OjGcCoRypa4gKtMlo6CSArsZZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQpPM9TU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQpPM9TU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729144680; x=1760680680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cIop3ta76NB9VhqfBbqgzgJ7F2ZlyX8UgmJTMLTIPx8=;
  b=GQpPM9TU/OeEnBnGfhW9Zzu7fh8DD17yAgEFHcrnSs5CP53KkVihtV+G
   tDfKX1X7aH0FGjER75jeL9+ceNqblM5ILqZMT0EYAEXP2gPQ75mPyowkw
   HQhYo25g3BRrDEj5eEQa0nn5cCss3kYCE6L/z4HioQx9g0GHMiqRrKIoR
   qd2wTfC9GHhkXHQwnKIZVhzC2MuAxDtDoY1MPTW6Vy+OlGLaAYeIUajkH
   G+883EVTZpsrHZdakaGXdeUvG5fa/edpLIN/RPBWaxwMQnMpCONek5mA9
   rHIYnnNxZ6V/xZyiy4hNJ0kHT1Kylv7SycHn0KnJ3kLtMCgk0OXEfK46N
   Q==;
X-CSE-ConnectionGUID: FzC8PyJxQdyt6XEX50pWwg==
X-CSE-MsgGUID: xiOZz2+rSjm6DGetf3Fjfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="16234285"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="16234285"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 22:57:59 -0700
X-CSE-ConnectionGUID: /eW1pWEIS/OSsw1gZkDlZg==
X-CSE-MsgGUID: e7rM9eS4S1WZP+13V399yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="83096476"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Oct 2024 22:57:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1JWG-000Lmd-17;
	Thu, 17 Oct 2024 05:57:56 +0000
Date: Thu, 17 Oct 2024 13:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 11/16] kismet: WARNING: unmet
 direct dependencies detected for FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
 when selected by ARM64
Message-ID: <202410171330.xOQ2yEB1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   36aa7422f5b4c5a064a78590cb58482f5bf424c9
commit: 32f999ced5d222fee0e23a34fb9356362d0e1ef7 [11/16] fprobe: Rewrite fprobe on function-graph tracer
config: arm64-kismet-CONFIG_FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY-CONFIG_ARM64-0-0 (https://download.01.org/0day-ci/archive/20241017/202410171330.xOQ2yEB1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241017/202410171330.xOQ2yEB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171330.xOQ2yEB1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY when selected by ARM64
   WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE_WITH_ARGS
     Depends on [n]: FTRACE [=y] && DYNAMIC_FTRACE [=n] && HAVE_DYNAMIC_FTRACE_WITH_ARGS [=y]
     Selected by [y]:
     - FPROBE [=y] && FTRACE [=y] && HAVE_FUNCTION_GRAPH_FREGS [=y] && HAVE_FTRACE_GRAPH_FUNC [=y]
   
   WARNING: unmet direct dependencies detected for FUNCTION_GRAPH_TRACER
     Depends on [n]: FTRACE [=y] && HAVE_FUNCTION_GRAPH_TRACER [=y] && FUNCTION_TRACER [=n] && (!X86_32 || !CC_OPTIMIZE_FOR_SIZE [=y])
     Selected by [y]:
     - FPROBE [=y] && FTRACE [=y] && HAVE_FUNCTION_GRAPH_FREGS [=y] && HAVE_FTRACE_GRAPH_FUNC [=y]
   
   WARNING: unmet direct dependencies detected for FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
     Depends on [n]: FTRACE [=y] && FTRACE_MCOUNT_RECORD [=n]
     Selected by [y]:
     - ARM64 [=y] && DYNAMIC_FTRACE_WITH_ARGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
