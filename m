Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573AA2367BF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582289; cv=none; b=R5BOyIST/G3zkOJ3H9VXe3++kKw0YkibCUKqe5Hbpru6u4A5cI1+jrvWkgl8NMelQtPkBhKH0isZXfJpmTqdSYnWHINU3W2rxTh/ZRjWQcuuFr1eFfmN3nGrzaIjUEbgYsyLX+9sN1KoOYE1J/HssEThBFof1wfD228bb2aAeaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582289; c=relaxed/simple;
	bh=FD/LxcPGni3IIHeLKZstBs+UbIbv3l8UHKH1/4wo2Zo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=coxGwnTaKyrQnpn3iJMABg99n/udh4zRhHh+bZa35YHWCFFXx5TPTvGgRAY/6Dv2qgsTBA+qdLpdxdarI5F29wJAjdYr/jKCzXVLdnoPsZ2xAscGN6/1tC6aAINrHbDDTbPETAAhQC23YboULXDkmywin3Sp9c7wtRZ1kFW/T8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTpXlaOV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTpXlaOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6029C4CEEB;
	Thu,  7 Aug 2025 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754582289;
	bh=FD/LxcPGni3IIHeLKZstBs+UbIbv3l8UHKH1/4wo2Zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uTpXlaOVHb6nXsUTsQ3DV9tbu0j1ZSNqGCkpgK3mbC11IiT98agKW6XBspsYvK1Rg
	 FJQohNGfyCiNXvxpp4cLg+97A/4NNWKlglQmiUBhJXJsX2sqcsu91fIZMkz0mW28OK
	 aKFrCIVfv9SBXt25y3siLhF/LG8sT16C+mdzFt4PA4hUjmdeiSI27cb7uRk+S243cj
	 HKOHshz5+BGJ4Y+FfqSVQt8B4dCiDjFMxb43+XRQfDt2r4r/SI0cZmhU6ao1mjWDnj
	 GgNzUwmbNq4J88T3cS9l0a37WJr8+2PtDhKRtckvNINyNPuTJLltxP7SSpd5s9r5As
	 0NW/EpPbC/Bjw==
From: SeongJae Park <sj@kernel.org>
To: Philip Li <philip.li@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	kernel test robot <lkp@intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [sj:mm-new 42/45] ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.spk_ttyio_synth_probe.str1.4'
Date: Thu,  7 Aug 2025 08:58:05 -0700
Message-Id: <20250807155805.25652-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <aJRS3iAcvITYGKxq@rli9-mobl>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 7 Aug 2025 15:16:46 +0800 Philip Li <philip.li@intel.com> wrote:

> On Wed, Aug 06, 2025 at 10:51:38PM -0700, SeongJae Park wrote:
> > On Wed,  6 Aug 2025 22:43:49 -0700 SeongJae Park <sj@kernel.org> wrote:
> > 
> > > On Thu, 7 Aug 2025 06:31:25 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> > > 
> > > > +cc SJ, as his tree :)
> > > 
> > > Thank you, Lorenzo!
> > > 
> > > > 
> > > > On Thu, Aug 07, 2025 at 12:03:03PM +0800, kernel test robot wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git mm-new
> > > > 
> > > > Not sure why SJ isn't cc'd when it's his tree?
> > > > 
> > > > Not sure how easy it would be for the scripts to figure this out.
> > > 
> > > As people might already realized, it is Andrew's mm-new branch.  I started
> > > pushing Andrew's mm-{new,unstable,stable} branches to my tree for backup
> > > purpose, since DAMON development branch (damon/next) is using mm-new as its
> > > baseline.  Seems it caused confusion to kernel test robot and other people.
> > > Sorry about that.
> > > 
> > > kernel test robot, is there a way to mark mm-{new,unstable,stable} branches on
> > > my tree be ignored from your tests?  If there is no good way, I can remove the
> > > branches from my tree.
> > 
> > To stop more confusion first rather than waiting for the answer, I just deleted
> > the mm-{new,unstable,stable} branches from my tree.  I don't really depend on
> > those branches on my tree since I can keep fetching Andrew's tree or using my
> > trees outside of kernel.org.  So this is no problem for me.
> > 
> > kernel test robot, please let me know if there is a way to mark specific
> > branches on my tree be ignored from your tests, though, if you get a time and
> > have an idea.
> 
> Yes, the test bot supports this to ignore branches by pattern, for example,
> 
> 	branch_denylist: .*-wip|.*-v[0-9]*|.*-[0-9]*
> 	branch_denylist: mirror/.*

Cool.

> 
> Do you want to just ignore mm-{new,unstable,stable} branches, I can configure the
> repo to handle this?

Great, could you please do so?


Thanks,
SJ

[...]
