Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8133A7F7A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240583; cv=none; b=e9wndBbRAKOONU7lwiU4In4++QXBC/IBJfve64Dj6fjZn2DcQdNqQLkkF9KojZHGVkNF+lpaIsvmXyf4TTed9NvuWkNUEbyWlQLcT/APp3escf7j97Fd+XU2+RQ2t8smg85UDnUCjbNosaVEAUBiNMoh7Zw0o/0b3ksVC2KY5wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240583; c=relaxed/simple;
	bh=7kf9Te8DMvLlsariR8Wr76uxbL6UNe5Y+jaC6bsSFQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbhuAUAACM6KySICaXNrnFAFapRVrrxcD8KJO9bNy+kcfEBwOrLhq3zzfphwkR0dMAGHAgZGCyrX3rEPmgddcYt3CLEGjjqnmnvPjWWAmCZ17XRRZxNcwno+A/0i68pQp2fe5U3e5lKxpsHfMzFZ55SsUpqynU/g9ZDWAuE6TMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVhGmCQr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVhGmCQr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA6E1F000E9;
	Tue, 28 Jul 2026 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785240582;
	bh=P88dCM2lHUR3MSjLBw5X3fur7lQTKPPKUxYx0y4glFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RVhGmCQrvqfjLkvPGrknWuwqOd99+Ezy+taMZhvqKeGsbGgKF9YtpfKp9XjGqcmHe
	 RuGVmIKVEZePwbMrCs5cTlF5mCV4OdEnYDAyypu8EnatG+nfCSlVXIZ08/4yEdE5gq
	 TNKVRR05r4o6KCZvbKwps2wMHl6NvtgiOqWK3UtPsP1Y9BnV+w0OLYCax24eks/vjR
	 QP9jiBsBKmJoTuc5LKUgagTseRehJpFZWqRXK0wgGVUvqdWO3AEVpvkdXQf/3nfALJ
	 jv7HLQy03Mq61ET5lBlJ3Gzlg2FJ5Egb2ZsFlExdKehlYELKxt131orjgMkU7RkjJJ
	 tIso9Dyuif0Ew==
Date: Tue, 28 Jul 2026 14:09:38 +0200
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: Re: [brauner-vfs:vfs.all 208/263] ERROR: modpost:
 "__inode_attach_wb" [fs/ext4/ext4.ko] undefined!
Message-ID: <20260728-kringeln-gaspedal-wertung-4ecd0e2f8bbe@brauner>
References: <202607281811.F3c6kRvX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202607281811.F3c6kRvX-lkp@intel.com>

On Tue, Jul 28, 2026 at 07:14:17PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
> head:   e6f9ac7f8b2d4704a972e843688fa736ea0431db
> commit: c26339e1df335423bcbb83d6fa6ff94b1545b8ed [208/263] ext4: Fix data integrity writeout issues in nojournal mode
> config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260728/202607281811.F3c6kRvX-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281811.F3c6kRvX-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607281811.F3c6kRvX-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "__inode_attach_wb" [fs/ext4/ext4.ko] undefined!

Fixed in-tree.
