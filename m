Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D06284693
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 02:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774061872; cv=none; b=G1M8sDA7I5YGLt4FbbsfaNGQlIXa24iUXd8xPVEH7kbpQ0uuq334MT0TY8WkFCczIMxVgB+8Qhd+Hxo8IEkm4FwlENeUTZr/MkbGbNNAXqa1QmGh6HQUEttrjsllokAtwW0abuPYGJ8z6FFjWzHCTYauGBaTX3HsQY+XC+0xs4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774061872; c=relaxed/simple;
	bh=3Ld+Bo+s4N7G21DAwj9B2IqP3mz/F6xhNWlb3jU1350=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=uA88eSmUGM7xA+Bj9WL9jw06oNaOaAH+ULVt+tZ9QFLDTEeBfYxs4F3BM8ideHiz7eoVM9opUadk9RMWURum/MVnkofWbNjjO1XZcBjudrOqT/TXUlBFRv3OshO93QDNmQZOA2O32rS0QoT+hRAAKapmycDF5GEpicz0DV+6ORM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dIFbPnmL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dIFbPnmL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB81BC4CEF7;
	Sat, 21 Mar 2026 02:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774061872;
	bh=3Ld+Bo+s4N7G21DAwj9B2IqP3mz/F6xhNWlb3jU1350=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dIFbPnmLtC6W/10EY5wh5URryJ5bF4t87dTPXyy84knzzJN/XXRse9csZSst0Wiv2
	 c265qvRFZ1hXF4zPxBb7YanL3ikCcrnt11Ji08HSmJhwmhMERR6m+N7/dUhZrLZEqD
	 2MBaYSzpzlkhcrB5SjQ/5IWIsbs77evtcLrZaV2U=
Date: Fri, 20 Mar 2026 19:57:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Chris Down <chris@chrisdown.name>, oe-kbuild-all@lists.linux.dev, David
 Hildenbrand <david@kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: Re: [akpm-mm:mm-unstable 433/449] vm_util.c:133:14: error: too many
 arguments to function 'pagemap_scan_supported'
Message-Id: <20260320195751.5b08b3e32ca835c3451d7bcd@linux-foundation.org>
In-Reply-To: <202603210319.P5MPyTEf-lkp@intel.com>
References: <202603210319.P5MPyTEf-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 21 Mar 2026 03:34:21 +0100 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   28edd9c5a25ceb76c2d4e55bc5c37acd7eb0fc92
> commit: 6fa1bf6b010deb50b35d2b2a7c97e7e229f2747e [433/449] selftests/mm: add UFFDIO_MOVE huge zeropage PMD regression test
> config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260321/202603210319.P5MPyTEf-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210319.P5MPyTEf-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603210319.P5MPyTEf-lkp@intel.com/
> 
> Note: the akpm-mm/mm-unstable HEAD 28edd9c5a25ceb76c2d4e55bc5c37acd7eb0fc92 builds fine.
>       It only hurts bisectability.

No, there is no later patch which fixes this.

> All errors (new ones prefixed by >>):
> 
>    vm_util.c: In function 'pagemap_is_huge_zero':
> >> vm_util.c:133:14: error: too many arguments to function 'pagemap_scan_supported'
>      133 |         if (!pagemap_scan_supported(fd, start))
>          |              ^~~~~~~~~~~~~~~~~~~~~~
>    vm_util.c:70:13: note: declared here
>       70 | static bool pagemap_scan_supported(int fd)
>          |             ^~~~~~~~~~~~~~~~~~~~~~
> 

Thanks, I assume this:

--- a/tools/testing/selftests/mm/vm_util.c~selftests-mm-add-uffdio_move-huge-zeropage-pmd-regression-test-fix
+++ a/tools/testing/selftests/mm/vm_util.c
@@ -130,7 +130,7 @@ bool pagemap_is_huge_zero(int fd, char *
 {
 	uint64_t categories;
 
-	if (!pagemap_scan_supported(fd, start))
+	if (!pagemap_scan_supported(fd))
 		return false;
 
 	categories = pagemap_scan_get_categories(fd, start);
_

