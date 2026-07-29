Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C1232E141
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339342; cv=none; b=XUfgzWRj5X6GvGs7QUqdaYTNcNKSkxtwx2/kWCq6na6s3c1yMVsTbVBU92aCwdF009lv1inM0YfR1Mm3xU4xufooJtzzUIjadeykEKYwetsKgskafBz5XsWZ7Q8ej6EkJnKWA8pyEtC0IP3YyvuN/nmhp8/SGZZxJS/NupfspuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339342; c=relaxed/simple;
	bh=AGEnXGh9ttrVSJlR16iHHX3V1y9DBIPi3oCx+IYAdrg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DcpoDtTPyKA+cANOyXLMt704KOBI12V3Vv7oIjaXjSjSfL2Bwwceie+GoFM4S3Rb5d3kD4FYp1gHkZLudIdi0PhkW67QMAtDK1Xg9StE3g0PrcfALETN5kAL8XOm359qBbko6yknwmjdluzQJb7qKA/UrJg/+j//1DFyexuWbCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id A7DBA806E4;
	Wed, 29 Jul 2026 15:35:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 154B02F;
	Wed, 29 Jul 2026 15:35:38 +0000 (UTC)
Date: Wed, 29 Jul 2026 11:36:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [trace:trace/core 16/16] WARNING: modpost: vmlinux: section
 mismatch in reference: trace_printk_init_buffers.part.0+0xc8 (section:
 .text.unlikely) -> initcall_level_names (section: .init.data)
Message-ID: <20260729113613.7f6af519@gandalf.local.home>
In-Reply-To: <202607291326.Dr0maCyu-lkp@intel.com>
References: <202607291326.Dr0maCyu-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 154B02F
X-Stat-Signature: mgd4caxonb5h4un1ifbhjs6be4j8pdeb
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18STmQF8rYKA+7AqTDp82FphauO9pYBb6c=
X-HE-Tag: 1785339337-541150
X-HE-Meta: U2FsdGVkX19NYE7hCYo/KIZdSVHLNdK1vXXLuF7+ab5OqfriUhgNe8w/KFUIGeiQia/XFHmofxOc5Sivd+bka4PGjVlkhk8QZDWARnRC8hbU70rxABrGLv4XLq3Zh7chdxWBEoD1WExRI8lEkbCR8Fa3wOKDbYUqPYurHa9AAp9aNvfq6GDB/rMWiS2Cv65hskyChWcePOaOeqn9k35Wx/zg5ApVBnSit/dl59TbgG9RmGNSJw5D5qMPL/usX3fSPPYSytguDit2Ha2L7TSmnliMwXQj4llaa/BiG5HCF0rS3G5ONWLuR7WNmK0C1tz7r+X4lM78ay7C+4BBh1bS5rBIiDwpRrWODkYmM8sSDCSllbqhdSc85St0vd4PT4pr+SahxAu6SCPiEzmUXuvdid05hO6S//moxb6EysM1EkR9JpMAkya0hXyTnwdFuGFNjCcDIXkGGr4=

On Wed, 29 Jul 2026 13:14:23 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/core
> head:   c33330b2ec170dd38b3284a72bc6a07a49cc9a65
> commit: c33330b2ec170dd38b3284a72bc6a07a49cc9a65 [16/16] tracing: Use seq_buf for string concatenation
> config: xtensa-randconfig-001-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291326.Dr0maCyu-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 12.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291326.Dr0maCyu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607291326.Dr0maCyu-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> WARNING: modpost: vmlinux: section mismatch in reference: trace_printk_init_buffers.part.0+0xc8 (section: .text.unlikely) -> initcall_level_names (section: .init.data)  
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This looks to be a false positive. I have no idea how the above commit
could cause that warning.

-- Steve
