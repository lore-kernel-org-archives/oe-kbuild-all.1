Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147BD16EC1B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 06:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725259761; cv=none; b=Jh/l4rwG+vOhjsJjYzaNqWFgDdPRj3iv0WbRT1COKKKJwKkYOZyKHwTm2bbibQyRGCTnQriYWCj4w6EnSJttn2tq9pQcC/4fO6i7Z9k68H9RJYuNvZGJtTLyRDeyuPzbWdqtHbh64BA/KXGz/75tkRhGd/isWw+Zw1L7a8R3Wb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725259761; c=relaxed/simple;
	bh=qWxRzCHnzIBJ4DND0TJRaPMmhldHv3MY8IAiCuRCEi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4IWGyNISjC75Wsfwiymibb8oNGOG8XCkrmpl9hwRZ3WaPbR2/x2szwpFYBMUQWCcqcgFjRRwMKOhDB2A+vA+sO9V2Xq30qneiGghb93Ngq/Mj30zyKJDVm9/bzmUuMxmOHiXtH46sYUm7qLrK6xdY0eQpc1PWIH0hX8ePlNm6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IL7lpBdv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IL7lpBdv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E03C4CEC2;
	Mon,  2 Sep 2024 06:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725259760;
	bh=qWxRzCHnzIBJ4DND0TJRaPMmhldHv3MY8IAiCuRCEi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IL7lpBdv6jLhlfsn4btlzHoTauKJc2octM1UUTnTpkhiR3Z5jGhEmOXiZxHjcI8Uw
	 fz9mqyNFH3LYsR7epyiPGVcRL/aVK2DMfqGxff1u9R19TwMgP5QZ3qEdQjzaLt0CRP
	 TZF38BquNjR/PGLnQNY/UmWxixLEI6gkk6adiqv6hx/ewRm++Bb+3FXmthwDfIJvF3
	 RxUTg4eFHl98tgGInFepnwBxCv8L7b7XVtdBND8OtB6ypAW4dPbOqUSW9UtUvs8ivJ
	 3By2pp13K+IMRqpsFWvbII2MNUO9tXUf9TqdLKk992w+Qw+C6NffYUF07MqAjxp9uU
	 T2b/oR9ID90aA==
Date: Mon, 2 Sep 2024 09:46:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [linux-next:master 7142/8126]
 include/linux/numa_memblks.h:50:12: error: conflicting types for
 'phys_to_target_node'; have 'int(phys_addr_t)' {aka 'int(unsigned int)'}
Message-ID: <ZtVfSt_zloPdDqVB@kernel.org>
References: <202409020920.5S9U7dww-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202409020920.5S9U7dww-lkp@intel.com>

On Mon, Sep 02, 2024 at 09:12:06AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
> commit: 58b48700d8e043187d8032e0855f7ee8c4af5eac [7142/8126] mm: make range-to-target_node lookup facility a part of numa_memblks
> config: riscv-randconfig-r022-20221228 (https://download.01.org/0day-ci/archive/20240902/202409020920.5S9U7dww-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409020920.5S9U7dww-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409020920.5S9U7dww-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from mm/numa.c:6:
> >> include/linux/numa_memblks.h:50:12: error: conflicting types for 'phys_to_target_node'; have 'int(phys_addr_t)' {aka 'int(unsigned int)'}
>       50 | extern int phys_to_target_node(phys_addr_t start);
>          |            ^~~~~~~~~~~~~~~~~~~

Andrew, can you please apply this fixup?

diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
index 17d4bcc34091..cfad6ce7e1bd 100644
--- a/include/linux/numa_memblks.h
+++ b/include/linux/numa_memblks.h
@@ -47,7 +47,7 @@ static inline int numa_emu_cmdline(char *str)
 #endif /* CONFIG_NUMA_EMU */
 
 #ifdef CONFIG_NUMA_KEEP_MEMINFO
-extern int phys_to_target_node(phys_addr_t start);
+extern int phys_to_target_node(u64 start);
 #define phys_to_target_node phys_to_target_node
 extern int memory_add_physaddr_to_nid(u64 start);
 #define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
index a28507cf1e7f..be52b93a9c58 100644
--- a/mm/numa_memblks.c
+++ b/mm/numa_memblks.c
@@ -543,7 +543,7 @@ static int meminfo_to_nid(struct numa_meminfo *mi, u64 start)
 	return NUMA_NO_NODE;
 }
 
-int phys_to_target_node(phys_addr_t start)
+int phys_to_target_node(u64 start)
 {
 	int nid = meminfo_to_nid(&numa_meminfo, start);
 

-- 
Sincerely yours,
Mike.
