Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE37346E53;
	Tue, 13 Jan 2026 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322795; cv=none; b=n6RXQ/wQ0+yXza9EPjpNptnxpu+i4uTW3JNPlBtR0IPhtZL7ePRGF6e0mzemCIz4nZtwTz/inHmEDHDK63ZOI6flC8O/4VMzALSA2ArW4hO2ylQi6sV/MbxE0A+nJM5cyLz1idl0YJ39AK5rVEFA8ZwrEOiTpgWiltr5urKr3Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322795; c=relaxed/simple;
	bh=d+TmiBnnKB86RzVibPH8rQdaQvSyL5mmTdbpo6tUbAg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i9yQMYHrH/VVnzr+5MTDw5j4Q8hvL6a2i31pj6gWtboq5MliJLl8CWtxo7CPhdsQc0iLefN00X+qTcNH5eaKcvA7GpgZmNnMkfGHlGUM3Ina1SU4FwjAfai4Z+T2WEmA9ENMSHia9vevMzpc4p3VoEpDEgbkhkPm1EaJ67Yqb9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoPO2t5w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoPO2t5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AC3C116C6;
	Tue, 13 Jan 2026 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768322795;
	bh=d+TmiBnnKB86RzVibPH8rQdaQvSyL5mmTdbpo6tUbAg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DoPO2t5wz+370z0gKDX51AAc8WEjOzB1dD4fX5yw1KnHQQekVpzMJi0Qdmj+8d/EV
	 hM2cIWcWRsHz7FflE0lcBcjI9Mwq8Qy7MD5x0EDUccHCqQ3tSdvlLmAXn0T6q4A7sU
	 rSRoXhieAktwYAN5LHck1f/kyKnJabZNzcWNex0It9LHA/0SVrJsmFMB5gw6oFPGya
	 oRx/cf+MSDmi4cwAnffQ0s3Cq51r3w025kW7S9oR+cLIozmuBh0Fv1FRrZT3dh6Pbt
	 AlhRh/kR6AbiCpXBPIZR8P53xfYZHrmDTuu3NKZTu4MmZeUpwsKrZm/YyCrPOo40NW
	 xwssKBU5W0daw==
From: Thomas Gleixner <tglx@kernel.org>
To: kernel test robot <lkp@intel.com>, Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Ingo Molnar
 <mingo@kernel.org>
Subject: Re: [PATCH] time/sched_clock: Use ACCESS_PRIVATE() to evaluate
 hrtimer::function
In-Reply-To: <87jyxlk3w4.ffs@tglx>
References: <87jyxlk3w4.ffs@tglx>
Date: Tue, 13 Jan 2026 17:46:31 +0100
Message-ID: <878qe1jw9k.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jan 13 2026 at 15:01, Thomas Gleixner wrote:
> +	if (ACCESS_PRIVATE(sched_clock_timer, function) != NULL)) {

Bah. Sent the draft not the real thing.
