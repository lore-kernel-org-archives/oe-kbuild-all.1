Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A199D1A08D7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 19:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772369; cv=none; b=sj3RVDu38NCjVI7yRxyiaGP182ys44z4HkBsQ+PhKkTr+iA2vbSxsOIl8iA3YzfsysCJ1e9NQAatIs1bfQoMhCF53QkK7BXcGkp5puq45U1N4WCKOYoWNnZPz5mrXXxkAs4y5/gmf6q71fCbwFT+U61js5E1LZKfFIumlc0WwD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772369; c=relaxed/simple;
	bh=3xqO5KHYA9O6U4WH9VfDQhc9dZx6JAMOlVZ1K0WMjbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phhQfMHc24wvzjM0UJIzbXdEzT0EXE77x+HIa51QAwaaNjl+yOj8t3eGG4mGmOyiWYki2/d8uI6ceJr3l1jssgkY8w3rNeJNJsXnt1gjp1PHZccpYgNpHXimL9I4pvtaPn76W9H9J8ZQeAMOIGLbgkq3mZPBa8NxHCw180jP+Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRx2Ketn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRx2Ketn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3595CC4CED1;
	Mon,  9 Dec 2024 19:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733772368;
	bh=3xqO5KHYA9O6U4WH9VfDQhc9dZx6JAMOlVZ1K0WMjbo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=aRx2KetnzWRlEGZIJKXVz7le5e7voQqezGOL6zXM58jHdrvLkdFH4bTbyZiXRT22q
	 TXENrgdO4LcuPn2s9LSgFu4cXDbBr1ZuPvMdzgf40Pp9WBsT8wQgdyMziQ6oDfShZ1
	 CCS11HQ2LpmpXTkmHplci7s5US6QATO5rleLCEgGqHJznKoDLZcDlR7hBHWdicxgli
	 f4W0SiSq7SFP9Z3tf5sbwzeAN8BwRBGaiwscxg0YUsqtILP6qwSXJ1vm/omcj8TbON
	 URbOMaY76b2qDFLqfibyEDJV2iTXLtrI+9h9ZO/yZXVkQDk3wmqTNFjFRs1D2Nc6Rg
	 QEuqC9/g8+ZOA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CF0B1CE11A5; Mon,  9 Dec 2024 11:26:07 -0800 (PST)
Date: Mon, 9 Dec 2024 11:26:07 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2024.12.06a 51/54] ERROR: modpost:
 "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <7a6765a3-905a-4aad-947f-4b0685be7dc1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202412100025.jKNqFVCT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412100025.jKNqFVCT-lkp@intel.com>

On Tue, Dec 10, 2024 at 12:51:06AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2024.12.06a
> head:   f63522f041948f5f7f0f9720e944e1f62bdab03a
> commit: 53d1f60964efe0a700c81ccf72a1094efe279e9e [51/54] rcutorture: Include grace-period sequence numbers in failure/close-call
> config: nios2-randconfig-001-20241209 (https://download.01.org/0day-ci/archive/20241210/202412100025.jKNqFVCT-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100025.jKNqFVCT-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412100025.jKNqFVCT-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> ERROR: modpost: "__mulsi3" [kernel/rcu/rcutorture.ko] undefined!
> >> ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!

This commit added rcutorture_gather_gp_seqs(), to be sure, but all the
math that this function does is logical AND, SHIFT, and OR operations.

Might this be a toolchain issue?  Especially given that I am not finding
a __mulsi3 definition in arch/nios2, which suggests that it might be
part of the language runtime.

							Thanx, Paul

> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> ERROR: modpost: "__mulsi3" [kernel/scftorture.ko] undefined!
> ERROR: modpost: "__mulsi3" [fs/fat/fat.ko] undefined!
> ERROR: modpost: "__mulsi3" [fs/hfsplus/hfsplus.ko] undefined!
> ERROR: modpost: "__mulsi3" [fs/ecryptfs/ecryptfs.ko] undefined!
> ERROR: modpost: "__mulsi3" [fs/sysv/sysv.ko] undefined!
> ERROR: modpost: "__mulsi3" [fs/affs/affs.ko] undefined!
> ERROR: modpost: "__mulsi3" [fs/romfs/romfs.ko] undefined!
> WARNING: modpost: suppressed 725 unresolved symbol warnings because there were too many)
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
