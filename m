Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDDBEAE7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 02:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766284917; cv=none; b=dAB0WbIJ1Qzzs41nLnNpSt1VYWqaYk9FSQC3N1qwGuavJIVtHF+d2CWpSKHJeqejWi/gwlPNRQMuzc0jWmyJ1/y67Io1rG11blcXicrh3oLVp9slRAhtgeBsf9awP75yo7iBP7/FXqH8t22bTQV+3TuHRWA0t+OjS4Svo8NbfeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766284917; c=relaxed/simple;
	bh=28fTULV0Pit4lWeQI0Eqqr9w2b6MWY9hUCzs5oVmRv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BmYgim4qOxhtnDpNC4xXujd1Xkm00IsiVb1Yn1i+k2l9NCmMEwfu9cvxHJblF7r98jkqaT1MPB6EAQwtuRMsXeEjDORTdW3PzCeAispj9l7nCdzmPXOO+wdPm8S8MAqnGxOrgZ62P8SaJJD8FoJfuPOp3E+EhpoooWxvyxGTXvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiNK/ls+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiNK/ls+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766284915; x=1797820915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=28fTULV0Pit4lWeQI0Eqqr9w2b6MWY9hUCzs5oVmRv0=;
  b=RiNK/ls+SgjTWa9rn4prS2dFmxXgV8LvHq0Ep6zewfVDjEG/4QSBtj/J
   p+PPb/jTEMsXtvDlaNScvqCQoKlQ/imyBRKdjGBCnElYKXpFTLlHSv55V
   WZFadwpqbgWiFZRgkWFtoczyXYtZmLGvki2C2oncm5lK+/BoZFhnVLcHo
   BDNVIeJxYy7DXEzuB67l5oJPd76LAbZLraJE8OOmdrsh06mLCpJNJitoe
   H+J0t5wrnXoz+MZdVmByolMxfa5xJntxT0EB7lNsE2u24SD209YKi5sob
   SEgjj/LEl71dpxtnYD+VLzZnXe+h20+u+Ux0RMJdY+nC9DcvUjjMtvdiX
   w==;
X-CSE-ConnectionGUID: +WWCflhcTf+hV0qmuJGf2g==
X-CSE-MsgGUID: WU4/H7H7RqKk4U4pHekWFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68129417"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68129417"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 18:41:54 -0800
X-CSE-ConnectionGUID: 2CvFLhEEQCCmndi6bxTcaA==
X-CSE-MsgGUID: Md2BOvN5TFOKrDlFeYoSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198838722"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Dec 2025 18:41:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX9OJ-000000004uW-0x4d;
	Sun, 21 Dec 2025 02:41:51 +0000
Date: Sun, 21 Dec 2025 03:41:11 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-linus-next:linus-next 301/323] Diff in
 tools/llminus/src/main.rs:45:
Message-ID: <202512210344.u2E0uHWN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   aa285fa024dcb50460cc69d19f3545edbbd54eaa
commit: 495668ef74efb709fd297eeee48b1785ab2986a0 [301/323] LLMinus: Add skeleton project with learn command
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251221/202512210344.u2E0uHWN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210344.u2E0uHWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210344.u2E0uHWN-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in tools/llminus/src/main.rs:45:
    #[derive(Debug, Clone, Serialize, Deserialize)]
    pub struct FileResolution {
        pub file_path: String,
   -    pub file_type: String,      // Extension: "c", "h", "rs", etc.
   -    pub subsystem: String,      // Extracted from path: "drivers/gpu" -> "gpu"
   +    pub file_type: String, // Extension: "c", "h", "rs", etc.
   +    pub subsystem: String, // Extracted from path: "drivers/gpu" -> "gpu"
    
        /// Changes from base to ours (what our branch did)
        pub ours_diff: Vec<DiffHunk>,
   Diff in tools/llminus/src/main.rs:88:
    pub struct MergeResolution {
        pub commit_hash: String,
        pub commit_summary: String,
   -    pub commit_date: String,     // ISO format
   +    pub commit_date: String, // ISO format
        pub author: String,
    
        /// All files that required manual conflict resolution in this merge
   Diff in tools/llminus/src/main.rs:124:
                let content = std::fs::read_to_string(path)?;
                Ok(serde_json::from_str(&content)?)
            } else {
   -            Ok(Self { version: 2, resolutions: Vec::new() })
   +            Ok(Self {
   +                version: 2,
   +                resolutions: Vec::new(),
   +            })
            }
        }
    
   Diff in tools/llminus/src/main.rs:187:
    
    /// Get commit metadata
    fn get_commit_metadata(hash: &str) -> CommitMetadata {
   -    let format = git_allow_fail(&["log", "-1", "--format=%s%n%aI%n%an <%ae>", hash])
   -        .unwrap_or_default();
   +    let format =
   +        git_allow_fail(&["log", "-1", "--format=%s%n%aI%n%an <%ae>", hash]).unwrap_or_default();
        let mut lines = format.lines();
        CommitMetadata {
            summary: lines.next().unwrap_or_default().to_string(),
   Diff in tools/llminus/src/main.rs:205:
    
    /// Get merge base between two commits
    fn get_merge_base(commit1: &str, commit2: &str) -> Option<String> {
   -    git_allow_fail(&["merge-base", commit1, commit2])
   -        .map(|s| s.trim().to_string())
   +    git_allow_fail(&["merge-base", commit1, commit2]).map(|s| s.trim().to_string())
    }
    
    /// Extract file type from path
   Diff in tools/llminus/src/main.rs:261:
                if let Some(header) = parse_hunk_header(line) {
                    current_hunk = Some((header.0, header.1, header.2, vec![line.to_string()]));
                }
   -        } else if current_hunk.is_some() && (line.starts_with('+') || line.starts_with('-') || line.starts_with(' ')) {
   +        } else if current_hunk.is_some()
   +            && (line.starts_with('+') || line.starts_with('-') || line.starts_with(' '))
   +        {
                if let Some((_, _, _, ref mut lines)) = current_hunk {
                    lines.push(line.to_string());
                }
   Diff in tools/llminus/src/main.rs:306:
    
    /// Find files modified in both branches
    fn find_modified_in_both(parent1: &str, parent2: &str, base: &str) -> Result<Vec<String>> {
   -    let changed1 = git_allow_fail(&["diff", "--name-only", base, parent1])
   -        .unwrap_or_default();
   -    let changed2 = git_allow_fail(&["diff", "--name-only", base, parent2])
   -        .unwrap_or_default();
   +    let changed1 = git_allow_fail(&["diff", "--name-only", base, parent1]).unwrap_or_default();
   +    let changed2 = git_allow_fail(&["diff", "--name-only", base, parent2]).unwrap_or_default();
    
        let files1: HashSet<_> = changed1.lines().collect();
        let files2: HashSet<_> = changed2.lines().collect();
   Diff in tools/llminus/src/main.rs:316:
    
   -    Ok(files1.intersection(&files2).map(|s| s.to_string()).collect())
   +    Ok(files1
   +        .intersection(&files2)
   +        .map(|s| s.to_string())
   +        .collect())
    }
    
    /// Extract conflict resolutions from a merge commit
   Diff in tools/llminus/src/main.rs:345:
            let resolution_diff_raw = get_diff(&base, hash, &file_path);
    
            // Parse into hunks
   -        let ours_hunks = ours_diff_raw.as_ref().map(|d| parse_diff_hunks(d)).unwrap_or_default();
   -        let theirs_hunks = theirs_diff_raw.as_ref().map(|d| parse_diff_hunks(d)).unwrap_or_default();
   -        let resolution_hunks = resolution_diff_raw.as_ref().map(|d| parse_diff_hunks(d)).unwrap_or_default();
   +        let ours_hunks = ours_diff_raw
   +            .as_ref()
   +            .map(|d| parse_diff_hunks(d))
   +            .unwrap_or_default();
   +        let theirs_hunks = theirs_diff_raw
   +            .as_ref()
   +            .map(|d| parse_diff_hunks(d))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
