Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65D127815E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 19:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766343671; cv=none; b=rhoCI+PenVl94RZuqZ3zZoRvdvDl+oA9FHFyEY+2WwjN9UqlaUdskJgNBt7oPo/WYlF5tD7R1da7lKW0kvhfmO/s5u/41o9NwCN4tzgL9HHq5mD6Isbgw1KasJO7fPOMj4ggfm2wX/aDdMu22ul9JoNBkpU5CvZFQ03rBIQqE3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766343671; c=relaxed/simple;
	bh=geCc6qL7LkmKK67fzEQYcluCrT+GqQs2dGWFYPQTwIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fJ8uaZ6Q0+Nyg+NifsspBouUaiSgIBtWbG7KbcdRaOPmI3HSHZpy8KaFlK/mOZZ7xACMC+K6bgyBih7gutaBCUpBzx32WZnuXqhoX+gWRusHj5XhGNN5r3ZgnbR2ozucUZPZINCFol74xVyFLexX4+r24zdqjjIjmR0DBq/6Xjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvzBdqb3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvzBdqb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766343670; x=1797879670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=geCc6qL7LkmKK67fzEQYcluCrT+GqQs2dGWFYPQTwIo=;
  b=FvzBdqb3ppomdv7mnzTW0ciLcptx+1slGvED5yaKEI3FxW1cXyQhj2gS
   khOCaUrKFJ5WWl8zP5Ag8hd8sLwAVMc7Nt6vz1obLNzSHAHWzKFKI6tge
   FBRf1xm8llj47eIGTvXnxelAw1vjA/+64oCGqdM23SdahdEmTGhIHn6n0
   RfdFjlC29/+MgXNztrRaPYSwiIrmdTAl/ailvYNUK5+i45MfN6e8/wx3f
   EAD1ESU+G0xwu2XdzIERBOBCt8aWKIhD7/i4yHTBkNbpXrkO9pc811ydr
   wqUmsU2JjgW4vIAtvKPGqBGxknFqxqm2f9l22nvUGQVydLc0ThHjm7BeM
   Q==;
X-CSE-ConnectionGUID: KI7Z3KUGRPKizaOImelwdg==
X-CSE-MsgGUID: GhoAUCtsS0KEVSUN/rwMOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68293744"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68293744"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 11:01:08 -0800
X-CSE-ConnectionGUID: xOlqAoNJSgWKPW0+ea9uEA==
X-CSE-MsgGUID: m+ltx6N1QHSwjnX30AdIYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="236762124"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Dec 2025 11:01:07 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXOfw-000000005Ce-14y0;
	Sun, 21 Dec 2025 19:01:04 +0000
Date: Sun, 21 Dec 2025 20:00:34 +0100
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 35/62] warning: associated items `zeroed`
 and `as_raw` are never used
Message-ID: <202512212000.5sC4xJn4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e08116e258e28774a3770a80debc819b89928f45
commit: 8a33a772f7d73cc9cb83c339652be8d04171e6d1 [35/62] rust: io: resource: Add owned Resource initialiser
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251221/202512212000.5sC4xJn4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212000.5sC4xJn4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212000.5sC4xJn4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated items `zeroed` and `as_raw` are never used
   --> rust/kernel/io/resource.rs:80:19
   |
   78 | impl Resource {
   | ------------- associated items in this implementation
   79 |     /// Create a new zeroed [`Resource`]
   80 |     pub(crate) fn zeroed() -> Self {
   |                   ^^^^^^
   ...
   87 |     pub(crate) fn as_raw(&self) -> *mut bindings::resource {
   |                   ^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default
--
>> warning: used a field initializer for a tuple struct
   --> rust/kernel/io/resource.rs:81:9
   |
   81 | /         Resource {
   82 | |             0: Opaque::<bindings::resource>::zeroed(),
   83 | |         }
   | |_________^ help: use tuple initialization: `Resource(Opaque::<bindings::resource>::zeroed())`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#init_numbered_fields
   = note: `-W clippy::init-numbered-fields` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::init_numbered_fields)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
