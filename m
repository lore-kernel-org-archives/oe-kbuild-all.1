Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA8715D1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719021775; cv=none; b=D0t1d5Yf2IZdIYbkz3DP5h9IQdwAzsoB1J70N2q/qNeOY0wUpmjqoG+KVqPrbVm2WX2FSt082gUs9HUUetGTLumPaz7vkfzf9Ky89H6EDZqCeKqIRR3/BrIlvKQTrgyVwXwONNOQmIFoahHahxxgwgq96iIhcJVcUjtM0epthmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719021775; c=relaxed/simple;
	bh=uiCoW7O629XsbFYLNM09Ce+rWB0Foyabr2bHZbxCZfc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=suILua1lWpRpK6UPf7EdMkRBwSsjJiZJbfvrjuHwvmD53l0I0v6f6BbdjhA06Zh0RVo5HqHopN+VHcSFTiorSiYt0zYh24EaAQkX+5fqo+sQ3opNFs1PMXlh7ymYJUrm2lVhe0uuqKxpwdmpod9eFuuo2Ev6Lf/GSpXIiIF8Quc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QfZlfd/4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QfZlfd/4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FF7C2BBFC;
	Sat, 22 Jun 2024 02:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1719021775;
	bh=uiCoW7O629XsbFYLNM09Ce+rWB0Foyabr2bHZbxCZfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QfZlfd/4xGVyIBLiQ1Eh2QmJHtE8vaL92asTilwIZYPm9kVTAiUR5Me2BEmYIwB5n
	 mGBrJRtdzI3idRoHOwikc6MAQTH9GoQGmd1bZTkXdP+vHmqOwkwJSdjR60pOoianB+
	 4K2st0aq90DfOIINiLaX88vD8q2XyBdSo6f7PdaY=
Date: Fri, 21 Jun 2024 19:02:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Kairui Song <kasong@tencent.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, "Huang, Ying"
 <ying.huang@intel.com>
Subject: Re: [linux-next:master 6383/7397] mm/page_io.c:283:41: error:
 implicit declaration of function 'swap_dev_pos'
Message-Id: <20240621190254.8b81cfe0c84c4db57aa85bf0@linux-foundation.org>
In-Reply-To: <202406210911.j0JhlO0N-lkp@intel.com>
References: <202406210911.j0JhlO0N-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Jun 2024 10:10:36 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
> commit: d2b0c82185149e17ca3efc51c74c643c21668d63 [6383/7397] mm/swap: get the swap device offset directly
> config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/archive/20240621/202406210911.j0JhlO0N-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210911.j0JhlO0N-lkp@intel.com/reproduce)

I can't immediately see why this would happen and the above links are going 404.

