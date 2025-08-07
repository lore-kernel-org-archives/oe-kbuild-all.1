Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C33C33F3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 05:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754545903; cv=none; b=WcP1ZXiFhkwi6Gjgf7vtX7VWBdWQH2c6SfQuxA39Y12HZJOlQjispUaCPESdRy2GgM8Lok7AIR5r4Sx4LzPYr7wJmlIaIG+MyGI5v4UM0CnSVj2vCxnCPLxiXsuiFpIjL+aN/cuNgxOOLbIMeitt12qdDuHFYhWFiVkD5LTwmHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754545903; c=relaxed/simple;
	bh=hMMwBhKuihGVBsVlEMKrLDQOO44hxXlUQROdSYwgsKo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ye9Lydd7V5UYYenM1xagqSjAhCOF01USf1XcgZoBy0yenL0m0Z4wwUtxLF2J77lO3XNokGYfgxHLQiWWrEFQkf5CrMoOYcWiOOHBSJLKumva/wNomOpkkJzyy54I/TuNkUFaev6piDMHNHjt6kxivGInvJudOXbfOv/bRQMmEIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbhF+fvA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbhF+fvA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E02C4CEEB;
	Thu,  7 Aug 2025 05:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754545902;
	bh=hMMwBhKuihGVBsVlEMKrLDQOO44hxXlUQROdSYwgsKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FbhF+fvAHgyVj6TbgfmBW3/8HS/yRCdaih3hPIrJKLkMYtt27qE68ULEc5ukJV2AW
	 Wr1mgYVwX7OSCK2qx5VMEeNwiilo/K6Vt0hRah59um4NddfrKPd2L4rnrCf9c4imJS
	 R3nVxfcJWKapsx0kYOK9yfaFFvAKxqCJ79kSHz7BX60R3oyuzJ0ERBqBz6SCbMLVXs
	 0tAarkBZWtnGMFqoqGQBh5QjEuwK7divY3OJr4tJajJpIqm1UU4I4wXzOQYUnzk6Zs
	 vxN1yO7X6pZMkwyhF9H6OGql7WvwKyNHPErXFcZ4RYZyhPzKGHfVkVwL7UJu88qkeO
	 eSsLUuwm3aq9Q==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	kernel test robot <lkp@intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [sj:mm-new 42/45] ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.spk_ttyio_synth_probe.str1.4'
Date: Wed,  6 Aug 2025 22:51:38 -0700
Message-Id: <20250807055138.21727-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250807054349.21561-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  6 Aug 2025 22:43:49 -0700 SeongJae Park <sj@kernel.org> wrote:

> On Thu, 7 Aug 2025 06:31:25 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> 
> > +cc SJ, as his tree :)
> 
> Thank you, Lorenzo!
> 
> > 
> > On Thu, Aug 07, 2025 at 12:03:03PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git mm-new
> > 
> > Not sure why SJ isn't cc'd when it's his tree?
> > 
> > Not sure how easy it would be for the scripts to figure this out.
> 
> As people might already realized, it is Andrew's mm-new branch.  I started
> pushing Andrew's mm-{new,unstable,stable} branches to my tree for backup
> purpose, since DAMON development branch (damon/next) is using mm-new as its
> baseline.  Seems it caused confusion to kernel test robot and other people.
> Sorry about that.
> 
> kernel test robot, is there a way to mark mm-{new,unstable,stable} branches on
> my tree be ignored from your tests?  If there is no good way, I can remove the
> branches from my tree.

To stop more confusion first rather than waiting for the answer, I just deleted
the mm-{new,unstable,stable} branches from my tree.  I don't really depend on
those branches on my tree since I can keep fetching Andrew's tree or using my
trees outside of kernel.org.  So this is no problem for me.

kernel test robot, please let me know if there is a way to mark specific
branches on my tree be ignored from your tests, though, if you get a time and
have an idea.


Thanks,
SJ

[...]
