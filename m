Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6A01AA87
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 17:19:31 +0000 (UTC)
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 733986607030;
	Wed, 26 Jul 2023 18:19:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690391970;
	bh=fqpP9jiTYUJJ/YXTL3D/91z23S33CFRdb0nxTNzAb1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKMAhXd87Pz3u9D+MBCPHzIMOUmt5PYbBc6rFQ5WhPKdoPEC/S4MFxp+J1JR6VuLG
	 hbQLIXfThLSdQAZ6g16eWXLuKA9s9iGI0nWCWgRWgQ6nos21f6SnXz2sUOdJU+eMmX
	 tSTuwphH4TwFCZjWeWv739SVJzt9mCRt2KSobw8oSiWpkCYski8I6gxm9WPgl/zDK/
	 KVvDemDje5Y1GtR8mWEPxDYJGPqM2gyt+m8ycwvkPL4A6ICYL1FaHFKqWZUQ+p9tMC
	 Pn85C9V6WotqwwANmoMg6uQC3APzgMrCUGcVgezVodMbPMEU/HWSu1Va+AExRQ37wW
	 plfVtS9G/xPJQ==
Date: Wed, 26 Jul 2023 13:19:26 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: Consider vdecsys presence in
 reg range check
Message-ID: <a30e6a6b-d9d8-444b-9e0e-1ec2c2db2ece@notapiano>
References: <20230725204043.569799-1-nfraprado@collabora.com>
 <202307261640.z33a4YO8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202307261640.z33a4YO8-lkp@intel.com>

On Wed, Jul 26, 2023 at 04:47:21PM +0800, kernel test robot wrote:
> Hi Nícolas,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on media-tree/master]
> [also build test ERROR on linus/master v6.5-rc3 next-20230726]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

This patch should be applied to Hans' tree
(https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=for-v6.6i), since the
commit I'm fixing has only made its way there yet.

As a suggestion for improvement, consider checking whether the commit(s) listed
in the Fixes: tag(s) of the patches exist in the tree you're applying them to.

Anyway, I've sent a v2 now that has enough context that shouldn't even apply to
the main media tree.

Thanks,
Nícolas
