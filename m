Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BAC38DE5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 20:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707423718; cv=none; b=cf55DnXVVyZws7HhrUozR6zPzxzT+GFi+XfZCJE4B1iM3kSs8x05YgMxswb2PH3kRgxWcIy6E7mDYGJjHOei1yDK5nMWPuqLFCy90wsD/uCTyO5fk8CV+kgwQwdnDqEum66sdGjvJ+bsEgzqJAKiViQVaO8vQidrQB4+49v8/AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707423718; c=relaxed/simple;
	bh=puIi5luP3CGDHTx+EZYgMJNm1Q8kqi3c5AU6HZotmlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msS9/o80yuFAJwM019Zzp2qn5SYrfxgnadGNyg6XuVAbHmpOSbGf+fPvhryHjTDUqQMvTskqe8vq4bKr/ukTbAVEKAz4TcNKooyUZbUGcQN+f5JFmXO3s5ipCwYy6hFy0SZmRodYMz3ETAUWGlO9qfmE5/IqxyZfKBVyoVBbrjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=focW5DZz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="focW5DZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F19DC433C7;
	Thu,  8 Feb 2024 20:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707423717;
	bh=puIi5luP3CGDHTx+EZYgMJNm1Q8kqi3c5AU6HZotmlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=focW5DZz0eKA8ouGcNiqZ3qgcqE6KGtHkXuDraOi6dpv2AusGqRnNAaqM8l2j5rJL
	 9ogPBkxgGp8NmuO2LKbVF6RYOkFEDkNda6Kgdkq8uWIqeXBclF7CpenhOJI29POSf5
	 JtEX/ZU0glIYA+5lopy8vX4LzXSd3P4+R8opMFAQFMcuWp8R24CWcFhiiuiMYH0fkV
	 K2z6k0kYbfXdOvr2me8KfqnQ8Mmi7c0VEw8sR9caXDEy0G+o/EQACqsmo622NQ4znH
	 3dPB0rpsp4QPPcDJXxOhikkZ33smNxhBGIqRjKTkF+HdEfdzLipznYbjA+LbUAlLKO
	 2uouIw3OU3vFA==
Date: Thu, 8 Feb 2024 21:21:53 +0100
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, 
	oe-kbuild-all@lists.linux.dev, Christian Brauner <christianvanbrauner@gmail.com>, 
	Dave Chinner <dchinner@redhat.com>
Subject: Re: [brauner-vfs:vfs.uuid 1/7] fs/f2fs/super.c:4499:24: error:
 passing argument 1 of 'super_set_uuid' from incompatible pointer type
Message-ID: <20240208-einundzwanzig-gastgewerbe-ff38e52f2b4e@brauner>
References: <202402090354.8NTymfrK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202402090354.8NTymfrK-lkp@intel.com>

On Fri, Feb 09, 2024 at 04:09:40AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.uuid
> head:   f2c1430ccf161782bd8cfb549829a793a3791678
> commit: 4d451351605f0f73e5e49284b7bd726e9fb3f515 [1/7] fs: super_set_uuid()

Fixed up in the tree as mentioned earlier today.
