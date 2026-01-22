Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677963F23AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083064; cv=none; b=U8GrzabW9cFpRnLODPYHObjnrPLObdyfMj+pligHfKSvLsWEAuqV4M3sYDSv+ODvj/Q/Jc0drTSE7+1L4OP3N7dvhEkFwcyI0yUSRFYGQcGC30DJApI0zK5WgG2nN//XxrJ9OStdiLaFJiH7BCQDpRr6D+870uvQcMqHdfR2kck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083064; c=relaxed/simple;
	bh=YA0QC/uuVi/Pla7THUSaJVW+WVYLDQx6KC9zI0/c4G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQCwHZLhHiHNu2RqXMnBxIDuzKoAcQmMdstX6pvEyKHYFtoyqGg3pi5g2PWdmajXsQMd7NjZ3WSxy30J6nUfDw+cExvzKDGNboJhAr5j8nLKX2UMAUtv0vhFkEX+81qD49i72uEbuLDU4eBV+i03KYociVbRJTGTK/AQhKEF5nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CW2WiCbJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CW2WiCbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769083061; x=1800619061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YA0QC/uuVi/Pla7THUSaJVW+WVYLDQx6KC9zI0/c4G0=;
  b=CW2WiCbJ62mFwsXlPm6IfDlz5jjG1MI9Qgg+wpCNedtfXd2F/29Q7CKK
   T3jed2E/vQ+YFvOkaJseyBdl+1fh7AmsDAoc+C2FW1dWXLQYFnZqVIYS2
   +X/fRZUdENsGGf2pY32N0mlyIZ8BOPiWVdutu9DDCmR6CyHq7Z7kFRBHn
   Z8QxdO+dp1gSJJxUe5hAF8IvsiNEZHjWd+qJnmlt2J8HQ2oogo8H7t9U1
   roudKV3fWV/FMQT1sOryT3YrFj1d8nIhXwGnol8Y3ej1C24E0toJy8YQR
   4cuQj/Z6sT4Yn28LpdEnmqREZO4v0vokTPbs2ZXlGWPthsbo2VszvSc5s
   A==;
X-CSE-ConnectionGUID: GEKP9gAkSFa3tG/qd4DJ5Q==
X-CSE-MsgGUID: Em0WSff+S9eRulnTw3y4SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69340148"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="69340148"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 03:57:40 -0800
X-CSE-ConnectionGUID: Ql9UBEfsQDOWEC2fNwU64A==
X-CSE-MsgGUID: CI9rWv2OTcaAonwn5YcYJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="244323105"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Jan 2026 03:57:35 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vitJc-000000000Un-3JQD;
	Thu, 22 Jan 2026 11:57:32 +0000
Date: Thu, 22 Jan 2026 12:56:55 +0100
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v17 10/16] rust: sync: Introduce lock::Lock::lock_with()
 and friends
Message-ID: <202601221246.Qfwh5Atq-lkp@intel.com>
References: <20260121223933.1568682-11-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121223933.1568682-11-lyude@redhat.com>

Hi Lyude,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2ad6c5cdc89acfefb01b84afa5e55262c40d6fec]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/preempt-Introduce-HARDIRQ_DISABLE_BITS/20260122-064928
base:   2ad6c5cdc89acfefb01b84afa5e55262c40d6fec
patch link:    https://lore.kernel.org/r/20260121223933.1568682-11-lyude%40redhat.com
patch subject: [PATCH v17 10/16] rust: sync: Introduce lock::Lock::lock_with() and friends
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260122/202601221246.Qfwh5Atq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221246.Qfwh5Atq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221246.Qfwh5Atq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `Backend::BackendInContext`
   --> rust/kernel/sync/lock.rs:39:27
   |
   39 | /// [`BackendInContext`]: Backend::BackendInContext
   |                           ^^^^^^^^^^^^^^^^^^^^^^^^^ the trait `Backend` has no associated item named `BackendInContext`
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: unresolved link to `Backend::Context`
   --> rust/kernel/sync/lock.rs:40:18
   |
   40 | /// [`Context`]: Backend::Context
   |                  ^^^^^^^^^^^^^^^^ the trait `Backend` has no associated item named `Context`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
