Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E87428EB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Jun 2025 02:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749954256; cv=none; b=W8VA6THDuM0rDdVMoOzGafar2+FG/WZDq+DSbXfDugjG16raKkjXQqGvGgTR6KdJ29KGCMOM6gz123oQvVLXwJlYP9Q6WnESw/bsvsj1Kv+Y11Q867F2f2XcRFk8RQYtr6qL9Bu7SuDDTKff2XGqdd+izmYfl22S4DOcqLudjz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749954256; c=relaxed/simple;
	bh=wOTg94vnd+gQqKlz0KcVBNqIVpZK0Q2N1jMygRsP2kM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eYsbyPPBSlMsi14jKtKFiBuYQfsi35lfnVpV6nnifsBjFM4j6YO7R/ybxaZODsmshVzVlAY2ojqiJr6o7TPxrADOJbFPgQu0R9cXEfUxE3128lMk4gkHrOIqq7wlkO1Un4nlJKvtDhRsLzmjRPcr0ax3Ocg0WWwGOfBgqPwCb/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 996E71D775B;
	Sun, 15 Jun 2025 02:24:06 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id 1E8EF80011;
	Sun, 15 Jun 2025 02:24:05 +0000 (UTC)
Date: Sat, 14 Jun 2025 22:24:03 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 06/11] perf: Support deferred user callchains
Message-ID: <20250614222403.62f364be@batman.local.home>
In-Reply-To: <202506150123.IMpwyw55-lkp@intel.com>
References: <20250614024716.623432389@goodmis.org>
	<202506150123.IMpwyw55-lkp@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1E8EF80011
X-Rspamd-Server: rspamout08
X-Stat-Signature: xjzwr77oefdpqroixgef5tkz8zi45ma5
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX187ImeyKj3/ecf4YltoPhSs4Wn4BJSk+JU=
X-HE-Tag: 1749954245-282057
X-HE-Meta: U2FsdGVkX1/3zw6r+k1tuv/AclrZgPjmmY/UnVcMj1EyW7XCYKYCbQRId3RV1i6f5zNaYKkdgW0oIFF+NgugiaMjKdicui5BnNd/lFE1cbhO/3eVOQrgan0IvaRZoRarEmn5nG7MvWZnfcM0qoGwbW3CdSpjImLCLBQDujk7S/+CshIeZ5NnroEJJSdBPxbFf8a34ZHVavKQLwjHuj99aNP8Tk6Ni4poS2uXMyqSBsVdRm5125MiA+gQ2OTbAejJgT2i0n32vF2U2ISfR4gY8xRJ8255Ys9sG4ybMv91axEaGowHNIDYiofb8/01WiyWWnuB91xJKrez9uvkfE+qHJrdte059VEuZyX8imlE8OylY3WLKW7Wx5wmPftElDdqejnq4vcgcpXyOTvjGxjOCyh054xCver5wID4G1lBuh0M0zldRqNUkwcXtiRNSrEKt2+DWbp/4eU=

On Sun, 15 Jun 2025 01:32:52 +0800
kernel test robot <lkp@intel.com> wrote:

> [auto build test ERROR on perf-tools-next/perf-tools-next]
> [also build test ERROR on tip/perf/core linus/master v6.16-rc1 next-20250613]
> [cannot apply to perf-tools/perf-tools acme/perf/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

The cover letter stated:

  This is based on top of the deferred unwind core patch series:

    https://lore.kernel.org/linux-trace-kernel/20250611005421.144238328@goodmis.org/

  Which is based on top of v6.16-rc1.

-- Steve
