Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1172E370A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 05:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754545432; cv=none; b=DekQL5VwDCtCzTlo0CSqPRuYMQFivhfFhRHWMJ9MYLocn4QGlPvafkTSPB7IduOlxh5nFgWpWYnf9d9i5m3SVUAAfkEgfB6iJp8GVT+i6RfOiUzmgpfQQ6cCQtFf4Hs6sVQd8nfqDmFe5t+uxeYyVuwT9AEPXf+MXanH+ef3hkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754545432; c=relaxed/simple;
	bh=Y8PwWxG6NhZ4hx+lZSLdvTGtrL3od2PF9xFFQ+W+ihI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WsFQrRE4IC1NM1UlsvHy+SlOxxtsjVd+u/P57+vrSEIqf/adaYEi6dg2XJ94o01gVadTTjrmAzMvZkPeXhtlMoO72/PJIQiQn+JZRIFolAvtZFR5ul6LsvN6VQbpc5Oe5FTO3qamMn7BBfh2PVwgyTXa/xksUTm0yWqpxqiu4mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hb3nLQ3r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hb3nLQ3r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45990C4CEEB;
	Thu,  7 Aug 2025 05:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754545432;
	bh=Y8PwWxG6NhZ4hx+lZSLdvTGtrL3od2PF9xFFQ+W+ihI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hb3nLQ3rI+rQrDxsVy0fNAVqVVRPuh3IOBNbQwQffaCLHEyOmxW8ajOFndvk0C6k3
	 corApiL0Kw+Pe3p6j9f/AmG1AxjvmfuPzCOARahUqs5WCBN2LdleqYnugw5upmy6eB
	 2IARW757ZEPxsssBqjj5cTaFlnBdp0upaftcymIlBIeDS/ctjUQTJzPslcg6Mtcm6P
	 bA+NzrFlVseYBOkAdSbnBe9XhUyKq3S8ZqOhJFvXP8VLR3H7IdkxECGfD22lWVoMlW
	 fkp+jn4vf5sQxDI1dE7yH6DR2u18JLOe8anofFgEmSEwWeTf9MuvULRaV0BkOp1E9y
	 losb5z6b1LiTA==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [sj:mm-new 42/45] ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.spk_ttyio_synth_probe.str1.4'
Date: Wed,  6 Aug 2025 22:43:49 -0700
Message-Id: <20250807054349.21561-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <81fedf44-83dd-4f2b-9a2b-2f3d7ba4f922@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 7 Aug 2025 06:31:25 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> +cc SJ, as his tree :)

Thank you, Lorenzo!

> 
> On Thu, Aug 07, 2025 at 12:03:03PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git mm-new
> 
> Not sure why SJ isn't cc'd when it's his tree?
> 
> Not sure how easy it would be for the scripts to figure this out.

As people might already realized, it is Andrew's mm-new branch.  I started
pushing Andrew's mm-{new,unstable,stable} branches to my tree for backup
purpose, since DAMON development branch (damon/next) is using mm-new as its
baseline.  Seems it caused confusion to kernel test robot and other people.
Sorry about that.

kernel test robot, is there a way to mark mm-{new,unstable,stable} branches on
my tree be ignored from your tests?  If there is no good way, I can remove the
branches from my tree.


Thanks,
SJ

[...]
