Content-Type: multipart/mixed; boundary="===============3248979808347271285=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] tracing: __synth_event_add_val() can be static
Date: Tue, 04 Feb 2020 18:00:58 +0800
Message-ID: <20200204100058.2ryei5kjbp2rx6bv@f53c9c00458a>
In-Reply-To: <d1c8d8ad124a653b7543afe801d38c199ca5c20e.1580506712.git.zanussi@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3248979808347271285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 879f48404aa4 ("tracing: Consolidate some synth_event_trace code")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 trace_events_hist.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_h=
ist.c
index 789e90c96d9b4..d480aff45d0ce 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -2063,8 +2063,8 @@ int synth_event_trace_start(struct trace_event_file *=
file,
 }
 EXPORT_SYMBOL_GPL(synth_event_trace_start);
 =

-int __synth_event_add_val(const char *field_name, u64 val,
-			  struct synth_event_trace_state *trace_state)
+static int __synth_event_add_val(const char *field_name, u64 val,
+				 struct synth_event_trace_state *trace_state)
 {
 	struct synth_field *field =3D NULL;
 	struct synth_trace_event *entry;
--===============3248979808347271285==--

