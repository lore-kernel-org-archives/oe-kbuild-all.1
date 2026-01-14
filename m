Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998BB350283;
	Wed, 14 Jan 2026 20:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768421066; cv=none; b=nqWzYbSFMQ+hBz290IDpTJyiX84Yq37Qz1iRYH01JeCTsIY1L8Cs7ecNW/5dPtVq+RGQuV1a/TdfwCn4ze2+/VG7sAWMyosct7a+lZrMWecuDz8nEuDbvyAvCNiBtq2gJF83SEybRbWckLQK5aZ1NaxCobKBT8WoCnQLWh8Gb90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768421066; c=relaxed/simple;
	bh=u2o+MbQh4mcxOSZ0rvk7GH9sT3JvNMn5dD1fFv5UznU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qhQ8oxAlC4McYmBcxIPiOrg5jTwYJzJslsZoR/HoWIOF8UPc9TzwlCErP+SBxrNTiY1B8dKZQQoleBD+fq7oKIuPf6tZzckCFF217cJfIrZ/9prHspznGR7nanPT31jM9Sd7xYrxoqy+kZ4ec+dIfVpNxypxRXjaho8Ej4RYcnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZ028kOV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZ028kOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84757C4CEF7;
	Wed, 14 Jan 2026 20:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768421066;
	bh=u2o+MbQh4mcxOSZ0rvk7GH9sT3JvNMn5dD1fFv5UznU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SZ028kOV+QMdnYFfO1D2uKbx1zCYrtU6f31SPwwM1Zrg3D4aI61WcyX2Lspv4P4tT
	 cgp2Iw0q08daLObkoXe6p4YR0fPHx0sHrKfDvdjgsE+DVLbpDJfF7ACNAz44sTPpLl
	 iXBn8/kmknQxxziVrrSzXKJP3ZFPuw/qddizCSkirv/GLRnyePQtE5UD3tJjfwmw9E
	 2ndbCgB2XkdznDT283lnyOA6awc/Mc62VGUc/izDrvpHlhHhMKYJtSS2SEpdPr4Zog
	 wIyFi/jgPrJKc11wgL4YBBxVrOFaG9riSN4oH3rxMjiDouSzXNCCb6kFACHKLkCA4j
	 YBlOFSgHEnL+Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Ian Rogers <irogers@google.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [tip:timers/vdso 12/14] net/rds/ib_cm.c:96:35: sparse: sparse:
 incorrect type in argument 1 (different modifiers)
In-Reply-To: <CAP-5=fUyAtf9PQqYvagByK+-=-mN-T1zuLmxuvsPFVVHT3qLXA@mail.gmail.com>
References: <202601150001.sKSN644a-lkp@intel.com>
 <CAP-5=fUyAtf9PQqYvagByK+-=-mN-T1zuLmxuvsPFVVHT3qLXA@mail.gmail.com>
Date: Wed, 14 Jan 2026 21:04:22 +0100
Message-ID: <874ioohsft.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14 2026 at 09:51, Ian Rogers wrote:
> On Wed, Jan 14, 2026 at 8:37=E2=80=AFAM kernel test robot <lkp@intel.com>=
 wrote:
> I think there are 2 options:
> 1) ignore the new sparse warning as tech debt for later clean up,
> 2) modify the cast to be "const void*" instead of "void *" and play
> more wac-a-mole.

Option #3:

You might have tried the 'const void*' cast and figured out that sparse
is still unhappy. I actually did, but I didn't try to figure out why as
that's really not my duty.

> My preference would be 1 as I have a suspicion I played 2 and thought
> the non-const cast was best (hence it being in the patch) given other
> issues.

Preferences based on suspicions are not really usefull. Please go and
figure out what's going on and either fix it in the kernel code or tell
the sparse folks what they are missing.

Leaving it unresolved and handwaved away is not an option.

Thanks,

        tglx
