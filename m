Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB051384AE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 20:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712263305; cv=none; b=rMI9LZrP39tw9SGYicn5ZC50y4twiSerZVErJ2AWnRywlivxuirsuo94Im70B8eljNyDIVCdL8kxPlAla2KzN7eyVeQEzGmVV6N8RXNgiyGgeAI81hvoDx2RM3l6jRMRrdT9yv0KBxLqI+pElvl3wUa3s/g5Rlmm6kRE7d5tNwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712263305; c=relaxed/simple;
	bh=5EXluho0KtN3URvwtosuDEWmlyynq454hH4ObqHZHag=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Z02Ol4t8JoznHijgxDvT9y3t4RHnsCdzbekgrRw2oND0oXEXO9zhaee4JscP5SRmzzPt+tBWX73+J1wW9KbjYraVOVC3KVF9VYcGQZLUuOOiBkIlvxtorp7DSagVdrGytJ4iZXShMyvPrVOevmnuNu7WIjxO3XmrtbDrdeb8+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xCB5k9Se; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xCB5k9Se"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6DBC433F1;
	Thu,  4 Apr 2024 20:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1712263305;
	bh=5EXluho0KtN3URvwtosuDEWmlyynq454hH4ObqHZHag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xCB5k9SePGL1h1GjwnTTRnvuZmdNdiC8yJV6IlVJIMOf3ftmdVCLUngRHXgP04rA7
	 K3G7WehZQo9Qxiw+2DjJioBZrncTdVzzEcYmgShf/zlKAqGjvdHyOYgqJHRK2Us9dm
	 /xlxd456P2LEoOVZeD1prKQXkXpYLXjS3aZ0cakg=
Date: Thu, 4 Apr 2024 13:41:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>, Linux Memory Management
 List <linux-mm@kvack.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 2674/3921] mm/vmalloc.c:1079:3-9: preceding
 lock on line 1075 (fwd)
Message-Id: <20240404134144.8a13404ec84d0a8eddb6dd6f@linux-foundation.org>
In-Reply-To: <673197af-61f4-669b-e0f2-b229603498f1@inria.fr>
References: <673197af-61f4-669b-e0f2-b229603498f1@inria.fr>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 4 Apr 2024 16:19:42 -0400 (EDT) Julia Lawall <julia.lawall@inria.fr> wrote:

> Please check whether an unlock is needed before the return on line 1079.
> 

Thanks.  The code looks OK.  And documented!

> 53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1041)  * If success, a node is locked. A user is responsible to unlock it when a
> 53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1042)  * VA is no longer needed to be accessed.

