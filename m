Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F65F20B80B;
	Mon, 20 Jul 2026 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784572456; cv=none; b=KAhXNYbLvwYjtXPkO4Gfx4zknxlKD0DTfT6CAhKoXjbXFTxZom464Oosc0f09mBS4v9q+9tnkjTAE9tV7dwnEa/3wyo9pdOt59kzKz6MyUNXoPllGw4ZHBMjaTcajjxJMjV0O4f1H+3+O2sIXuKaHA354ScylvOBSb4pKBeQHfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784572456; c=relaxed/simple;
	bh=NO26Ob8021nMY2Vx+t069XdRFhZcaw/zqoiXCO6QM4c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aQDJeCjZgex4besT7RZfC10jUzs26ZHzLZdgEcPpbL7QuCCjvPAKd4qDOvm1FfnN738eHErl2bfwVkezZ33GaS2QiSthBN3d3eWz1zYERmYYg2qFpMBErzkylwHQ93grs0YTgxxbKP9mUuorqmxWHl5thDDSbyL9jrHdxCR8zAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMnOUPxd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMnOUPxd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3341F000E9;
	Mon, 20 Jul 2026 18:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784572455;
	bh=ZMznXognN6jY2O/6B40bWhwyjChnNEa4hJY3YWsHU04=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=MMnOUPxd+tSBSo5Ub06jWpINU1HA22b/gi6HBz0+dWhh47agujpF9qTw4JXXqhYR4
	 fHqL8v2s4x7ucxzFBnkYQf7TE5wAHjW0684r1OJxdtte76iuiOYAI4+B9Lkw/vtjov
	 PtT4VGUwXsQ7MF6E/lHQTpB+SsRSsjFMZX9FHVLP9BegeEmiJfuEHUe6rvSQiYts2N
	 HljbTvoZVLWj/LE7uR+jZkixZHQ1i1ghtYzksRhO+aE0pTtyXSMv0XJrbdhhgSvz2A
	 4XuBTfr+MnkCnxHgqOx1UrQZsyyAJi0GWBIXTDgdqZm6X/Sa8RSqIFpC7c7MFl2eam
	 AheBfOFp7yjzg==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, peterz@infradead.org,
 luto@kernel.org, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Sven
 Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH] entry: Provide stub for syscall_enter_audit() when
 auditing is disabled
In-Reply-To: <87cxwhn09i.ffs@fw13>
References: <20260720094921.537716-1-ruanjinjie@huawei.com>
 <87cxwhn09i.ffs@fw13>
Date: Mon, 20 Jul 2026 20:34:11 +0200
Message-ID: <87a4rlmrx8.ffs@fw13>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jul 20 2026 at 17:34, Thomas Gleixner wrote:
> On Mon, Jul 20 2026 at 17:49, Jinjie Ruan wrote:
> The .config in the report builds without problems with s390-linux-gcc
> 15.2.0 (I verified that before merging), but fails with the version used
> by the robot:
>
>    compiler: s390-linux-gcc (GCC) 13.4.0
>
> So that's a broken compiler and without understanding the actual root
> cause we are not going to paper over it.

What's even more amazing is that the same config modified for x86/64
builds just fine with gcc 13.4.0, while one would assume that the
decision to uninline a basically empty inline would happen before the
architecture specific backend is invoked. But what do I know. :)

